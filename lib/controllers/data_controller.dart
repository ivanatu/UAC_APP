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
}
