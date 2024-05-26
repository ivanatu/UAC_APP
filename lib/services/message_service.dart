import '../models/messages_model.dart';
import '/exports/exports.dart';

class MessageService {
  Future<List<Datum>> getMessages() async {
    try {
      var request = Request(
        'GET',
        Uri.parse(Apis.messages),
      );
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String? responseString = await response.stream.bytesToString();
        return messagesModelFromJson(responseString).data;
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
