class AntiretroviralResponse {
  final List<Antiretroviral> data;

  AntiretroviralResponse({required this.data});

  factory AntiretroviralResponse.fromJson(Map<String, dynamic> json) =>
      AntiretroviralResponse(
        data: List<Antiretroviral>.from(
          (json['data'] as List).map((x) => Antiretroviral.fromJson(x)),
        ),
      );
}

class Antiretroviral {
  final int id;
  final AntiretroviralAttributes attributes;

  Antiretroviral({required this.id, required this.attributes});

  factory Antiretroviral.fromJson(Map<String, dynamic> json) => Antiretroviral(
        id: json['id'],
        attributes: AntiretroviralAttributes.fromJson(json['attributes']),
      );
}

class AntiretroviralAttributes {
  final String title;
  final String value;

  AntiretroviralAttributes({required this.title, required this.value});

  factory AntiretroviralAttributes.fromJson(Map<String, dynamic> json) =>
      AntiretroviralAttributes(
        title: json['title'] ?? '',
        value: json['value']?.toString() ?? '0',
      );
}
