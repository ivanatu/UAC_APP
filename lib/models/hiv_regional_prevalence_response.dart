class HivRegionalPrevalenceResponse {
  final HivRegionalPrevalenceResponseData data;
  final Meta meta;

  HivRegionalPrevalenceResponse({required this.data, required this.meta});

  factory HivRegionalPrevalenceResponse.fromJson(Map<String, dynamic> json) =>
      HivRegionalPrevalenceResponse(
        data: HivRegionalPrevalenceResponseData.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "meta": meta.toJson(),
  };
}

class HivRegionalPrevalenceResponseData {
  final int id;
  final PurpleAttributes attributes;

  HivRegionalPrevalenceResponseData({
    required this.id,
    required this.attributes,
  });

  factory HivRegionalPrevalenceResponseData.fromJson(
    Map<String, dynamic> json,
  ) => HivRegionalPrevalenceResponseData(
    id: json["id"],
    attributes: PurpleAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes.toJson(),
  };
}

class PurpleAttributes {
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final MapClass map;

  PurpleAttributes({
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.map,
  });

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) =>
      PurpleAttributes(
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        map: MapClass.fromJson(json["map"]),
      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "publishedAt": publishedAt.toIso8601String(),
    "map": map.toJson(),
  };
}

class MapClass {
  final MapData data;

  MapClass({required this.data});

  factory MapClass.fromJson(Map<String, dynamic> json) =>
      MapClass(data: MapData.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"data": data.toJson()};
}

class MapData {
  final int id;
  final FluffyAttributes attributes;

  MapData({required this.id, required this.attributes});

  factory MapData.fromJson(Map<String, dynamic> json) => MapData(
    id: json["id"],
    attributes: FluffyAttributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes.toJson(),
  };
}

class FluffyAttributes {
  final String name;
  final dynamic alternativeText;
  final dynamic caption;
  final int width;
  final int height;
  final Formats formats;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final String url;
  final dynamic previewUrl;
  final String provider;
  final dynamic providerMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  FluffyAttributes({
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

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) =>
      FluffyAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
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
    "ext": ext,
    "mime": mime,
    "size": size,
    "url": url,
    "previewUrl": previewUrl,
    "provider": provider,
    "provider_metadata": providerMetadata,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

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
  final String ext;
  final String mime;
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
    ext: json["ext"],
    mime: json["mime"],
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
    "ext": ext,
    "mime": mime,
    "path": path,
    "width": width,
    "height": height,
    "size": size,
    "sizeInBytes": sizeInBytes,
    "url": url,
  };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
