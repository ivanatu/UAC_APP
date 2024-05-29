import '../models/cases_model.dart';
import '/exports/exports.dart';

class CasesService {
  // function to fetch available cases
  static Future<List<Datum>> fetchCases() async {
    try {
      var request = Request(
        'GET',
        Uri.parse(Apis.cases),
      );
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String result = (await response.stream.bytesToString());
        return casesModelFromJson(result).data;
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
