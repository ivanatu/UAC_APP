import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'index.dart';

/// A comprehensive API helper class that provides optimized REST methods
/// with caching, retry logic, and error handling
class ApiHelper {
  final String baseUrl;
  final Duration timeout;
  final Map<String, String> defaultHeaders;
  final http.Client _client;

  // Cache for API responses
  final Map<String, _CacheEntry> _cache = {};
  final Duration _cacheDuration;

  // Retry configuration
  final int maxRetries;
  final Duration retryDelay;

  ApiHelper({
    this.baseUrl = Apis.url,
    this.timeout = const Duration(seconds: 30),
    Map<String, String>? defaultHeaders,
    Duration cacheDuration = const Duration(minutes: 5),
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
    http.Client? client,
  }) : defaultHeaders = defaultHeaders ?? {'Content-Type': 'application/json'},
       _cacheDuration = cacheDuration,
       _client = client ?? http.Client();

  /// GET request with caching support
  Future<dynamic> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool useCache = true,
    Duration? cacheDuration,
  }) async {
    final uri = _buildUri(endpoint, queryParams);
    final cacheKey = uri.toString();

    // Check cache
    if (useCache && _cache.containsKey(cacheKey)) {
      final cached = _cache[cacheKey]!;
      if (!cached.isExpired) {
        return cached.data;
      } else {
        _cache.remove(cacheKey);
      }
    }

    final response = await _executeWithRetry(
      () => _client.get(uri, headers: _mergeHeaders(headers)),
    );

    final data = _handleResponse(response);

    // Cache successful response
    if (useCache) {
      _cache[cacheKey] = _CacheEntry(
        data: data,
        timestamp: DateTime.now(),
        duration: cacheDuration ?? _cacheDuration,
      );
    }

    return data;
  }

  /// POST request
  Future<dynamic> post(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic>? queryParams,
  }) async {
    final uri = _buildUri(endpoint, queryParams);

    final response = await _executeWithRetry(
      () => _client.post(
        uri,
        headers: _mergeHeaders(headers),
        body: body != null ? jsonEncode(body) : null,
      ),
    );

    return _handleResponse(response);
  }

  /// PUT request
  Future<dynamic> put(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic>? queryParams,
  }) async {
    final uri = _buildUri(endpoint, queryParams);

    final response = await _executeWithRetry(
      () => _client.put(
        uri,
        headers: _mergeHeaders(headers),
        body: body != null ? jsonEncode(body) : null,
      ),
    );

    return _handleResponse(response);
  }

  /// PATCH request
  Future<dynamic> patch(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic>? queryParams,
  }) async {
    final uri = _buildUri(endpoint, queryParams);

    final response = await _executeWithRetry(
      () => _client.patch(
        uri,
        headers: _mergeHeaders(headers),
        body: body != null ? jsonEncode(body) : null,
      ),
    );

    return _handleResponse(response);
  }

  /// DELETE request
  Future<dynamic> delete(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
  }) async {
    final uri = _buildUri(endpoint, queryParams);

    final response = await _executeWithRetry(
      () => _client.delete(
        uri,
        headers: _mergeHeaders(headers),
        body: body != null ? jsonEncode(body) : null,
      ),
    );

    return _handleResponse(response);
  }

  /// Batch multiple GET requests in parallel with optimized performance
  Future<List<dynamic>> batchGet(
    List<String> endpoints, {
    Map<String, String>? headers,
    bool useCache = true,
  }) async {
    final futures = endpoints.map(
      (endpoint) => get(endpoint, headers: headers, useCache: useCache),
    );

    return await Future.wait(futures);
  }

  /// Upload file with multipart request
  Future<dynamic> uploadFile(
    String endpoint,
    File file, {
    String fileField = 'file',
    Map<String, String>? headers,
    Map<String, String>? additionalFields,
  }) async {
    final uri = _buildUri(endpoint);
    final request = http.MultipartRequest('POST', uri);

    // Add headers
    request.headers.addAll(_mergeHeaders(headers));

    // Add file
    request.files.add(await http.MultipartFile.fromPath(fileField, file.path));

    // Add additional fields
    if (additionalFields != null) {
      request.fields.addAll(additionalFields);
    }

    final streamedResponse = await _executeWithRetry(() => request.send());

    final response = await http.Response.fromStream(streamedResponse);

    return _handleResponse(response);
  }

  /// Download file
  Future<void> downloadFile(
    String endpoint,
    String savePath, {
    Map<String, String>? headers,
    void Function(int received, int total)? onProgress,
  }) async {
    final uri = _buildUri(endpoint);
    final request = http.Request('GET', uri);
    request.headers.addAll(_mergeHeaders(headers));

    final streamedResponse = await _client.send(request).timeout(timeout);

    if (streamedResponse.statusCode != 200) {
      throw ApiException(
        'Failed to download file: ${streamedResponse.statusCode}',
        statusCode: streamedResponse.statusCode,
      );
    }

    final file = File(savePath);
    final sink = file.openWrite();
    final contentLength = streamedResponse.contentLength ?? 0;
    int received = 0;

    await streamedResponse.stream
        .map((chunk) {
          received += chunk.length;
          onProgress?.call(received, contentLength);
          return chunk;
        })
        .pipe(sink);

    await sink.close();
  }

  /// Clear all cached responses
  void clearCache() {
    _cache.clear();
  }

  /// Clear specific cached endpoint
  void clearCacheForEndpoint(String endpoint) {
    final uri = _buildUri(endpoint);
    _cache.remove(uri.toString());
  }

  /// Update default headers
  void updateHeaders(Map<String, String> headers) {
    defaultHeaders.addAll(headers);
  }

  /// Set authorization token
  void setAuthToken(String token) {
    defaultHeaders['Authorization'] = 'Bearer $token';
  }

  /// Remove authorization token
  void removeAuthToken() {
    defaultHeaders.remove('Authorization');
  }

  /// Build URI from endpoint and query parameters
  Uri _buildUri(String endpoint, [Map<String, dynamic>? queryParams]) {
    final path = endpoint.startsWith('/') ? endpoint : '/$endpoint';
    final url = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;

    return Uri.parse('$url$path').replace(
      queryParameters: queryParams?.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );
  }

  /// Merge default headers with custom headers
  Map<String, String> _mergeHeaders(Map<String, String>? customHeaders) {
    return {...defaultHeaders, if (customHeaders != null) ...customHeaders};
  }

  /// Execute request with retry logic
  Future<T> _executeWithRetry<T>(Future<T> Function() request) async {
    int attempts = 0;

    while (attempts < maxRetries) {
      try {
        return await request().timeout(timeout);
      } on SocketException catch (e) {
        attempts++;
        if (attempts >= maxRetries) {
          throw ApiException('No internet connection', originalError: e);
        }
        await Future.delayed(retryDelay * attempts);
      } on TimeoutException catch (e) {
        attempts++;
        if (attempts >= maxRetries) {
          throw ApiException('Request timeout', originalError: e);
        }
        await Future.delayed(retryDelay * attempts);
      } on http.ClientException catch (e) {
        attempts++;
        if (attempts >= maxRetries) {
          throw ApiException('Network error', originalError: e);
        }
        await Future.delayed(retryDelay * attempts);
      }
    }

    throw ApiException('Max retry attempts exceeded');
  }

  /// Handle HTTP response
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return null;
      }

      try {
        return jsonDecode(response.body);
      } catch (e) {
        return response.body;
      }
    } else {
      String message;
      try {
        final errorBody = jsonDecode(response.body);
        message =
            errorBody['message'] ?? errorBody['error'] ?? 'Request failed';
      } catch (_) {
        message = response.body.isNotEmpty ? response.body : 'Request failed';
      }

      throw ApiException(
        message,
        statusCode: response.statusCode,
        responseBody: response.body,
      );
    }
  }

  /// Close the HTTP client
  void dispose() {
    _client.close();
  }
}

/// Cache entry for storing API responses
class _CacheEntry {
  final dynamic data;
  final DateTime timestamp;
  final Duration duration;

  _CacheEntry({
    required this.data,
    required this.timestamp,
    required this.duration,
  });

  bool get isExpired => DateTime.now().difference(timestamp) > duration;
}

/// Custom exception for API errors
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final String? responseBody;
  final dynamic originalError;

  ApiException(
    this.message, {
    this.statusCode,
    this.responseBody,
    this.originalError,
  });

  @override
  String toString() {
    if (statusCode != null) {
      return 'ApiException: $message (Status: $statusCode)';
    }
    return 'ApiException: $message';
  }

  bool get isNetworkError => statusCode == null;
  bool get isClientError =>
      statusCode != null && statusCode! >= 400 && statusCode! < 500;
  bool get isServerError => statusCode != null && statusCode! >= 500;
  bool get isUnauthorized => statusCode == 401;
  bool get isForbidden => statusCode == 403;
  bool get isNotFound => statusCode == 404;
}
