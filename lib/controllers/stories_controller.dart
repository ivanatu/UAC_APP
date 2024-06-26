import 'package:aids_awareness_app/exports/exports.dart';

import '../models/stories_model.dart';
import '../services/stories_service.dart';

class StoriesController with ChangeNotifier {
  List<Datum> _stories = [];
  List<Datum> get stories => _stories;
// loader
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void getStories() {
    StoriesService().getStories().then((value) {
      _stories = value;
      _isLoading = false;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
