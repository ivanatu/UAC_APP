import 'package:aids_awareness_app/models/progress_95_model.dart';

import '../services/progress_95_service.dart';
import '/exports/exports.dart';

class Progress95Controller with ChangeNotifier {
  List<Datum> _items = [];
  List<Datum> get items => _items;
  // loader
  bool _loading = true;
  bool get loading => _loading;

  void setItems() {
    Progress95Service.getProgress95().then((value) {
      _loading = false;
      // generate map
      _items = value;
      notifyListeners();
    });
  }
}
