import 'dart:developer';

import '../services/myth_service.dart';
import '/models/myth_model.dart';

import '/exports/exports.dart';

class MythController with ChangeNotifier {
  List<Datum> _mythList = [];
  List<Datum> get mythList => _mythList;
  // loader
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void getMythList() {
    MythService.getMyth().then((value) {
      _mythList = value;
      _isLoading = false;
      notifyListeners();
    }).onError((error, stk) {
      log("Error: $error");
    });
  }
}
