import '/models/progress_95_model.dart';

import '../services/progress_95_service.dart';
import '/exports/exports.dart';

class Progress95Controller with ChangeNotifier {
  List<Datum> _items = [];
  List<Datum> get items => _items;

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  bool _hasFetched = false;

  Future<void> setItems({bool force = false}) async {
    if (_loading) return;
    if (_hasFetched && !force) return;

    _loading = true;
    _error = null;
    notifyListeners();

    try {
      _items = await Progress95Service.getProgress95();
      _hasFetched = true;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
