import '../models/summary_each_country.dart';

String BASE_URL = "https://aids.jamiejungleugandasafaris.com/aids/items";

Future<List<SummaryEachCountry>> getTopCountriesList() async{
  List<SummaryEachCountry> countries = [];
  final districts = [
    ["Kampala", "30000", "1000", "2000", "true"],
    ["Jinja", "40000", "5000", "3000", "false"],
    ["Masaka", "3430", "1400", "12000", "true"],
    ["Entebbe", "9000", "5000", "2500", "true"],
    ["Mukono", "90000", "43000", "200", "false"],
    ["Rakai", "32100", "9800", "2130", "true"]
  ];

  districts.forEach((element) {
    SummaryEachCountry summary = SummaryEachCountry().formMap(element);
    countries.add(summary);
  });
  Future.delayed(Duration(milliseconds: 100), () {
  });
  return countries;
}
