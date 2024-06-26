import 'package:aids_awareness_app/models/aids_info_model.dart';

import '/exports/exports.dart';

class AidsInfoService {
  static Future<List<Datum>> getAidsInfo() async {
    try {
      var request = Request('GET', Uri.parse(Apis.aids_info));

      StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return aidsInfoModelFromJson(await response.stream.bytesToString())
            .data;
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
