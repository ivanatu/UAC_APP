// To parse this JSON data, do

class TestingCascadeResponse {
  final List<TestingCascade> data;
  final Meta meta;

  TestingCascadeResponse({required this.data, required this.meta});

  factory TestingCascadeResponse.fromJson(Map<String, dynamic> json) =>
      TestingCascadeResponse(
        data: List<TestingCascade>.from(
          json["data"].map((x) => TestingCascade.fromJson(x)),
        ),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class TestingCascade {
  final int id;
  final Attributes attributes;

  TestingCascade({required this.id, required this.attributes});

  factory TestingCascade.fromJson(Map<String, dynamic> json) => TestingCascade(
    id: json["id"],
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes.toJson(),
  };
}

class Attributes {
  final String title;
  final String value;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  Attributes({
    required this.title,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    title: json["title"],
    value: json["value"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "value": value,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "publishedAt": publishedAt.toIso8601String(),
  };
}

class Meta {
  final Pagination pagination;

  Meta({required this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) =>
      Meta(pagination: Pagination.fromJson(json["pagination"]));

  Map<String, dynamic> toJson() => {"pagination": pagination.toJson()};
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
