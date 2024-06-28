import 'package:flutter/material.dart';

import '../models/national_prevalence_model.dart';
import '../services/national_prevalence_service.dart';

class NationalPrevalenceController with ChangeNotifier {
  List<Datum> _items = [];
  List<Datum> get items => _items;
  bool _loading = true;
  bool get loading => _loading;

  void fetchNationalPrevalence() {
    NationalPrevalenceService().getNationalPrevalence().then((prevalence) {
      _items = prevalence;
      _loading = false;
      notifyListeners();
    });
  }
}
