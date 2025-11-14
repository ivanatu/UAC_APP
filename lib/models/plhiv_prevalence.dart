class PlhivResponse {
  final List<Plhiv> data;
  final Meta meta;

  PlhivResponse({required this.data, required this.meta});

  factory PlhivResponse.fromJson(Map<String, dynamic> json) => PlhivResponse(
    data: List<Plhiv>.from(json["data"].map((x) => Plhiv.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Plhiv {
  final int id;
  final Attributes attributes;

  Plhiv({required this.id, required this.attributes});

  factory Plhiv.fromJson(Map<String, dynamic> json) => Plhiv(
    id: json["id"],
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes.toJson(),
  };
}

class Attributes {
  final String populationGroup;
  final String valueByYear;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  Attributes({
    required this.populationGroup,
    required this.valueByYear,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    populationGroup: json["PopulationGroup"],
    valueByYear: json["ValueByYear"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publishedAt: DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "PopulationGroup": populationGroup,
    "ValueByYear": valueByYear,
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
