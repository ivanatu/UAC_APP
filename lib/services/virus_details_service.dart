import '../apis/api_helper.dart';
import '../models/virus_details_model.dart';

class VirusDetailsService {
  final _apiHelper = ApiHelper();
  Future<VirusDetailsModel> getVirusDetailsInfo() async {
    var response = await _apiHelper.get('about-hiv?populate=*');
    return response;
  }
}
