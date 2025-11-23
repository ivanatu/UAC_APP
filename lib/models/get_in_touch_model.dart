class GetInTouchModel {
  final GetInTouchData data;
  final Meta meta;

  GetInTouchModel({required this.data, required this.meta});

  factory GetInTouchModel.fromJson(Map<String, dynamic> json) =>
      GetInTouchModel(
        data: GetInTouchData.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "meta": meta.toJson(),
  };
}

class GetInTouchData {
  final int id;
  final Attributes attributes;

  GetInTouchData({required this.id, required this.attributes});
  factory GetInTouchData.fromJson(Map<String, dynamic> json) => GetInTouchData(
    id: json["id"],
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes.toJson(),
  };
}

class Attributes {
  final String email;
  final String website;
  final String address;
  final String whatsapp;
  final String twitter;
  final String facebook;
  final String hours;
  final String telephone;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  Attributes({
    required this.email,
    required this.website,
    required this.address,
    required this.whatsapp,
    required this.twitter,
    required this.facebook,
    required this.hours,
    required this.telephone,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    email: json["email"],
    website: json["website"],
    address: json["address"],
    whatsapp: json["whatsapp"],
    twitter: json["twitter"],
    facebook: json["facebook"],
    hours: json["hours"],
    telephone: json["telephone"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "website": website,
    "address": address,
    "whatsapp": whatsapp,
    "twitter": twitter,
    "facebook": facebook,
    "hours": hours,
    "telephone": telephone,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "publishedAt": publishedAt.toIso8601String(),
  };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
