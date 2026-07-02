class VirusDetailsModel {
  final VirusDetailsData data;
  final VirusDetailsMeta meta;

  VirusDetailsModel({required this.data, required this.meta});

  factory VirusDetailsModel.fromJson(Map<String, dynamic> json) =>
      VirusDetailsModel(
        data: VirusDetailsData.fromJson(json["data"]),
        meta: VirusDetailsMeta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "meta": meta.toJson(),
  };
}

class VirusDetailsData {
  final int id;
  final VirusDetailsAttributes attributes;

  VirusDetailsData({required this.id, required this.attributes});

  factory VirusDetailsData.fromJson(Map<String, dynamic> json) =>
      VirusDetailsData(
        id: json["id"],
        attributes: VirusDetailsAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes.toJson(),
  };
}

class VirusDetailsAttributes {
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  VirusDetailsAttributes({
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory VirusDetailsAttributes.fromJson(Map<String, dynamic> json) =>
      VirusDetailsAttributes(
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
    "description": description,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "publishedAt": publishedAt.toIso8601String(),
  };
}

class VirusDetailsMeta {
  VirusDetailsMeta();

  factory VirusDetailsMeta.fromJson(Map<String, dynamic> json) =>
      VirusDetailsMeta();

  Map<String, dynamic> toJson() => {};
}
