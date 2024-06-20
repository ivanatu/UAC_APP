import '../models/newz_model.dart';
import '/exports/exports.dart';

class NewzService {
  Future<List<Datum>> getNews() async {
    try {
      var request = Request(
        'GET',
        Uri.parse(Apis.newz),
      );

      StreamedResponse response = await request.send();
// print(response);
      if (response.statusCode == 200) {
        String? result = (await response.stream.bytesToString());
        return newsModelFromJson(result).data;
      } else {
        return Future.error(response.reasonPhrase ?? "Invalid response");
      }
    } catch (e, stk) {
      print("Error: $stk");
      return Future.error(e.toString());
    }
  }
}
