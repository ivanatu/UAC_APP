import '/models/faqs_model.dart';

import '/exports/exports.dart';

class FaqsService {
  static Future<List<Datum>> fetchFAQs() async {
    try {
      var response = await Client().get(
        Uri.parse(Apis.faqs),
      );
      // StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String res = (await response.body);
        Client().close();
        return faqsFromJson(res).data;
      } else {
        Client().close();
        return Future.error(response.reasonPhrase ?? "");
      }
    } on Exception catch (e) {
      Client().close();
      return Future.error(e.toString());
    }
  }
}
