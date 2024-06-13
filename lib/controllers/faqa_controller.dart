import '../services/faqs_service.dart';
import '/models/faqs_model.dart';
import '/exports/exports.dart';

class FaqaController with ChangeNotifier {
  List<Datum> _items = [];
  bool _loading = true;
  bool get loading => _loading;
  List<Datum> get items => _items;

  void setItems() {
    FaqsService.fetchFAQs().then((value) {
      _items = value;
      _loading = false;
      notifyListeners();
    });
  }
}
