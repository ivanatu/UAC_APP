import 'dart:developer';

import '/models/aids_info_model.dart';

import '../exports/exports.dart';
import '../services/aids_info_service.dart';

class AidsInfoController with ChangeNotifier {
  List<Datum> _aidsInfoList = [];
  List<Datum> get aidsInfoList => _aidsInfoList;
// loader
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void getAidsInfoList() {
    AidsInfoService.getAidsInfo().then((value) {
      _aidsInfoList = value;
      _isLoading = false;
      notifyListeners();
    }).onError((error, stk) {
      log("Error: $error");
    });
  }
}
