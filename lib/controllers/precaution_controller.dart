import 'dart:developer';

import '../models/precaution_model.dart';
import '../services/precaution_service.dart';
import '/exports/exports.dart';

class PrecautionController with ChangeNotifier {
  List<Datum> _precautionList = [];
  List<Datum> get precautionList => _precautionList;
  // loader
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void getPrecautionList() {
    PrecautionService.getPrecaution().then((value) {
      _precautionList = value;
      _isLoading = false;
      notifyListeners();
    }).onError((error, stk) {
      log("Error: $error");
    });
  }
}
