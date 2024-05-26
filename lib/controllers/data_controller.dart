import 'package:aids_awareness_app/services/update_service.dart';

import '/services/message_service.dart';
import '/models/messages_model.dart';
import '/exports/exports.dart';

class DataController with ChangeNotifier {
  List<Datum> _items = [];
  List<Datum> get items => _items;

  void setItems() {
    MessageService().getMessages().then((value) {
      _items = value;
      notifyListeners();
    });
  }

  // updates
  List<dynamic> _updates = [];
  List<dynamic> get updates => _updates;
  bool _loading = true;
  bool get loading => _loading;
  void fetchUpdates() {
    UpdateService.getNews().then((data) {
      _updates = data;
      notifyListeners();
    });
  }
}
