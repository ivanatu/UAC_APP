import '/apis/api_helper.dart';
import '/models/antiretroviral_model.dart';

class AntiretroviralService {
  final ApiHelper _apiHelper = ApiHelper();

  Future<List<Antiretroviral>> getCoverage() async {
    final response = await _apiHelper.get('antitretroviral-therapies');
    return AntiretroviralResponse.fromJson(response).data;
  }
}
