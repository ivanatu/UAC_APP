import 'package:uac/exports/exports.dart';

import '../models/get_in_touch_model.dart';
import '../services/get_in_touch_service.dart';

class GetInTouchController with ChangeNotifier {
  bool loading = false;
  GetInTouchData? getInTouchModel;

  Future<void> fetchGetInTouch() async {
    loading = true;
    notifyListeners();

    try {
      final response = await GetInTouchService.fetchContactDetails();
      getInTouchModel = response;
      notifyListeners();
    } catch (e) {
      // Handle error appropriately
      debugPrint("Error fetching Get In Touch data: $e");
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
