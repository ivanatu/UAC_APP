import 'dart:developer';

import '../models/video_updates_model.dart';
import '../services/video_update_service.dart';
import '/exports/exports.dart';

class VideoUpdatesController with ChangeNotifier {
  List<Datum> _videoUpdatesList = [];
  List<Datum> get videoUpdatesList => _videoUpdatesList;
  // loader
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void getVideoUpdatesList() {
    VideoUpdateService.getVideoData().then((value) {
      _videoUpdatesList = value;
      _isLoading = false;
      notifyListeners();
    }).onError((error, stk) {
      log("Error: $error");
    });
  }
}
