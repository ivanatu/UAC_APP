// To parse this JSON data, do
//
//     final singleRegionModel = singleRegionModelFromJson(jsonString);

import 'dart:convert';

SingleRegionModel singleRegionModelFromJson(String str) =>
    SingleRegionModel.fromJson(json.decode(str));

String singleRegionModelToJson(SingleRegionModel data) =>
    json.encode(data.toJson());

class SingleRegionModel {
  final Dat data;
  final Meta meta;

  SingleRegionModel({
    required this.data,
    required this.meta,
  });

  factory SingleRegionModel.fromJson(Map<String, dynamic> json) =>
      SingleRegionModel(
        data: Dat.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
      };
}

class Districts {
  final List<Dat> data;

  Districts({
    required this.data,
  });

  factory Districts.fromJson(Map<String, dynamic> json) => Districts(
        data: List<Dat>.from(json["data"].map((x) => Dat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Attributes {
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final double prevalence;
  final Districts? districts;

  Attributes({
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.prevalence,
    this.districts,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        prevalence: json["Prevalence"]?.toDouble(),
        districts: json["districts"] == null
            ? null
            : Districts.fromJson(json["districts"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "Prevalence": prevalence,
        "districts": districts?.toJson(),
      };
}

class Dat {
  final int id;
  final Attributes attributes;

  Dat({
    required this.id,
    required this.attributes,
  });

  factory Dat.fromJson(Map<String, dynamic> json) => Dat(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
