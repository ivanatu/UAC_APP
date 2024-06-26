import 'package:aids_awareness_app/models/myth_model.dart';

import '/exports/exports.dart';

class MythService {
  static Future<List<Datum>> getMyth() async {
    var request = Request('GET', Uri.parse(Apis.myths));
    StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return mythsModelFromJson(await response.stream.bytesToString()).data;
    } else {
      return Future.error(response.reasonPhrase ?? "");
    }
  }
}
