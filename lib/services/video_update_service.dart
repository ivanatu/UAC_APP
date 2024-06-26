import '../models/video_updates_model.dart';
import '../network_requests/exceptions.dart';
import '/exports/exports.dart';

class VideoUpdateService {
  // get video data
  static Future<List<Datum>> getVideoData() async {
    try {
      final response = await Client().get(Uri.parse(Apis.videoUpdates));
      if (response.statusCode == 200) {
        return videoUpdatesModelFromJson(response.body).data;
      } else {
        return Future.error("error");
      }
    } on FetchDataException catch (fde, _) {
      return Future.error("error fetching");
    }
  }
}
