// To parse this JSON data, do
//
//     final messagesModel = messagesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MessagesModel messagesModelFromJson(String str) =>
    MessagesModel.fromJson(json.decode(str));

String messagesModelToJson(MessagesModel data) => json.encode(data.toJson());

class MessagesModel {
  final List<Datum> data;
  final Meta meta;

  MessagesModel({
    required this.data,
    required this.meta,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) => MessagesModel(
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
  final DatumAttributes attributes;

  Datum({
    required this.id,
    required this.attributes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class DatumAttributes {
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final String locale;
  final Image image;
  final Localizations localizations;

  DatumAttributes({
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.locale,
    required this.image,
    required this.localizations,
  });

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        title: json["title"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        locale: json["locale"],
        image: Image.fromJson(json["image"]),
        localizations: Localizations.fromJson(json["localizations"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "locale": locale,
        "image": image.toJson(),
        "localizations": localizations.toJson(),
      };
}

class Image {
  final Data data;

  Image({
    required this.data,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final int id;
  final DataAttributes attributes;

  Data({
    required this.id,
    required this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class DataAttributes {
  final String name;
  final dynamic alternativeText;
  final dynamic caption;
  final int width;
  final int height;
  final Formats formats;
  final String hash;
  final Ext ext;
  final Mime mime;
  final double size;
  final String url;
  final dynamic previewUrl;
  final String provider;
  final dynamic providerMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  DataAttributes({
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

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: extValues.map[json["ext"]]!,
        mime: mimeValues.map[json["mime"]]!,
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats.toJson(),
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

enum Ext { PNG }

final extValues = EnumValues({".png": Ext.PNG});

class Formats {
  final Medium thumbnail;
  final Medium small;
  final Medium medium;
  final Medium large;

  Formats({
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Medium.fromJson(json["thumbnail"]),
        small: Medium.fromJson(json["small"]),
        medium: Medium.fromJson(json["medium"]),
        large: Medium.fromJson(json["large"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "small": small.toJson(),
        "medium": medium.toJson(),
        "large": large.toJson(),
      };
}

class Medium {
  final String name;
  final String hash;
  final Ext ext;
  final Mime mime;
  final dynamic path;
  final int width;
  final int height;
  // final double size;
  final int sizeInBytes;
  final String url;

  Medium({
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.path,
    required this.width,
    required this.height,
    // required this.size,
    required this.sizeInBytes,
    required this.url,
  });

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
        name: json["name"] ?? "",
        hash: json["hash"] ?? "",
        ext: extValues.map[json["ext"]] ?? Ext.PNG,
        mime: mimeValues.map[json["mime"]] ?? Mime.IMAGE_PNG,
        path: json["path"] ?? "",
        width: json["width"] ?? 0,
        height: json["height"] ?? 0,
        // size: (json["size"]).toDouble() ?? 0.0,
        sizeInBytes: json["sizeInBytes"] ?? 0,
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "path": path,
        "width": width,
        "height": height,
        // "size": size,
        "sizeInBytes": sizeInBytes,
        "url": url,
      };
}

enum Mime { IMAGE_PNG }

final mimeValues = EnumValues({"image/png": Mime.IMAGE_PNG});

class Localizations {
  final List<dynamic> data;

  Localizations({
    required this.data,
  });

  factory Localizations.fromJson(Map<String, dynamic> json) => Localizations(
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}

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
