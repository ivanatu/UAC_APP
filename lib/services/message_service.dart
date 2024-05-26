import '../models/messages_model.dart';
import '/exports/exports.dart';

class MessageService {
  Future<List<Datum>> getMessages() async {
    try {
      var response = await Client().get(
        Uri.parse(Apis.messages),
      );
      if (response.statusCode == 200) {
        String responseString = await response.body;
        print(responseString);
        return messagesModelFromJson(responseString).data;
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } on Exception catch (e, x) {
      print(x.toString());
      return Future.error(e.toString());
    }
  }
}
