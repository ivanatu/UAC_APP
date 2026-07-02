import '../exports/exports.dart';
import '../models/virus_details_model.dart';
import '../services/virus_details_service.dart';

class VirusDetailsController with ChangeNotifier {
  final VirusDetailsService _virusDetailsService = VirusDetailsService();

  VirusDetailsModel? _virusDetailsModel;
  VirusDetailsModel? get virusDetailsModel => _virusDetailsModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getVirusDetailsInfo({bool forceRefresh = false}) async {
    _isLoading = true;
    notifyListeners();
    try {
      _virusDetailsModel = await _virusDetailsService.getVirusDetailsInfo(
        useCache: !forceRefresh,
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
