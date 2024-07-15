// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  final List<Datum> data;
  final Meta meta;

  NewsModel({
    required this.data,
    required this.meta,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Datum {
  final int id;
  final String title;
  final dynamic content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final String newzId;
  final Image image;
  final Image pdf;

  Datum({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.newzId,
    required this.image,
    required this.pdf,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        newzId: json["newz_id"],
        image: Image.fromJson(json["image"]),
        pdf: Image.fromJson(json["pdf"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "newz_id": newzId,
        "image": image.toJson(),
        "pdf": pdf.toJson(),
      };
}

class Image {
  final int id;
  final String name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;
  final Formats? formats;
  final String hash;
  final Ext ext;
  final Mime mime;
  final double size;
  final String url;
  final dynamic previewUrl;
  final Provider provider;
  final dynamic providerMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  Image({
    required this.id,
    required this.name,
    required this.alternativeText,
    required this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.previewUrl,
    required this.provider,
    required this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats:
            json["formats"] == null ? null : Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: extValues.map[json["ext"]]!,
        mime: mimeValues.map[json["mime"]]!,
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: providerValues.map[json["provider"]]!,
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats?.toJson(),
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": providerValues.reverse[provider],
        "provider_metadata": providerMetadata,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

enum Ext { PDF, PNG }

final extValues = EnumValues({".pdf": Ext.PDF, ".png": Ext.PNG});

class Formats {
  final Large thumbnail;
  final Large small;
  final Large medium;
  final Large large;

  Formats({
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Large.fromJson(json["thumbnail"]),
        small: Large.fromJson(json["small"]),
        medium: Large.fromJson(json["medium"]),
        large: Large.fromJson(json["large"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "small": small.toJson(),
        "medium": medium.toJson(),
        "large": large.toJson(),
      };
}

class Large {
  final String name;
  final String hash;
  final Ext ext;
  final Mime mime;
  final dynamic path;
  final int width;
  final int height;
  final double size;
  final int sizeInBytes;
  final String url;

  Large({
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.path,
    required this.width,
    required this.height,
    required this.size,
    required this.sizeInBytes,
    required this.url,
  });

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        name: json["name"],
        hash: json["hash"],
        ext: extValues.map[json["ext"]]!,
        mime: mimeValues.map[json["mime"]]!,
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        sizeInBytes: json["sizeInBytes"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "sizeInBytes": sizeInBytes,
        "url": url,
      };
}

enum Mime { APPLICATION_PDF, IMAGE_PNG }

final mimeValues = EnumValues(
    {"application/pdf": Mime.APPLICATION_PDF, "image/png": Mime.IMAGE_PNG});

enum Provider { LOCAL }

final providerValues = EnumValues({"local": Provider.LOCAL});

class Meta {
  final Pagination pagination;

  Meta({
    required this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
