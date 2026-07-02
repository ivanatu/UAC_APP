// import 'dart:developer';

import '../apis/api_helper.dart';
import '../models/virus_details_model.dart';

class VirusDetailsService {
  final _apiHelper = ApiHelper();
  Future<VirusDetailsModel> getVirusDetailsInfo({bool useCache = true}) async {
    var response = await _apiHelper.get('about-hiv?populate=*', useCache: useCache);
    // log(response.toString());
    return VirusDetailsModel.fromJson(response);
  }
}
