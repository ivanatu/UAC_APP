import '../models/progress_95_model.dart';
import '/exports/exports.dart';

class Progress95Service {
  // get
  static Future<List<Datum>> getProgress95() async {
    try {
      final response = await Client().get(
        Uri.parse(Apis.progress_95),
      );
      if (response.statusCode == 200) {
        return progess95ModelFromJson(response.body).data;
      } else {
        return Future.error(response.reasonPhrase!);
      }
    } catch (e, stk) {
      print(stk.toString());
      return Future.error(e.toString());
    }
  }
}
