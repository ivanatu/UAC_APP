import 'package:flutter/material.dart';

import '../models/national_prevalence_model.dart';
import '../services/national_prevalence_service.dart';

class NationalPrevalenceController with ChangeNotifier {
  List<Datum> _items = [];
  List<Datum> get items => _items;

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  bool _hasFetched = false;

  Future<void> fetchNationalPrevalence({bool force = false}) async {
    if (_loading) return;
    if (_hasFetched && !force) return;

    _loading = true;
    _error = null;
    notifyListeners();

    try {
      _items = await NationalPrevalenceService().getNationalPrevalence();
      _hasFetched = true;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
