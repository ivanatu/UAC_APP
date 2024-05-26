import 'package:aids_awareness_app/services/message_service.dart';

import '../models/messages_model.dart';
import '/exports/exports.dart';

class DataController with ChangeNotifier {
  List<Datum> _items = [];
  List<Datum> get items {
    if (_items.isEmpty) {
      _setItems();
    }
    return _items;
  }

  void _setItems() {
    MessageService().getMessages().then((value) {
      _items = value;
      notifyListeners();
    });
    _items = items;
    notifyListeners();
  }
}
