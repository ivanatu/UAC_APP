import '/models/stories_model.dart';
import '/exports/exports.dart';

class StoriesService {
  // get all stories
  Future<List<Datum>> getStories() async {
    try {
      var request = Request('GET', Uri.parse(Apis.stories));

      StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return storiesModelFromJson(await response.stream.bytesToString()).data;
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
