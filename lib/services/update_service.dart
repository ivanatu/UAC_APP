import 'dart:convert';
import '../utils/app_globals.dart';
import '/exports/exports.dart';
import '../network_requests/exceptions.dart';

class UpdateService {
  static String url = "$BASE_URL/aids_info?fields=*.*";
  static Future<List<dynamic>> getNews() async {
    var data;
    try {
      final response = await Client().get(Uri.parse(url));
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        var articles = data['data'];
        print(articles.length);
        return articles as List<dynamic>;
      } else {
        return Future.error("error");
      }
    } on FetchDataException catch (fde, _) {
      return Future.error("error fetching");
    }
  }
}
