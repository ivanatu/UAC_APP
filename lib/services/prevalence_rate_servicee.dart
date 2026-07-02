import 'package:uac/models/hiv_regional_prevalence_response.dart';

import '../apis/api_helper.dart';

class PrevalenceRateService {
  // This service would contain methods to fetch and process prevalence rate data
  ApiHelper _apiHelper = ApiHelper();

  Future<HivRegionalPrevalenceResponse> getRegionalPrevalence() async {
    var response = await _apiHelper.get('regional-hiv-prevalance?populate=*');
    return HivRegionalPrevalenceResponse.fromJson(response);
  }

  // new infections by sub-region
  Future<HivRegionalPrevalenceResponse> getNewInfectionsBySubRegion() async {
    var response = await _apiHelper.get(
      'new-hiv-prevalance-infectionz?populate=*',
    );
    return HivRegionalPrevalenceResponse.fromJson(response);
  }

  // ART coverage
  Future<HivRegionalPrevalenceResponse> getCoverageArtBySubRegion() async {
    var response = await _apiHelper.get('art-coverage-sub-region?populate=*');
    return HivRegionalPrevalenceResponse.fromJson(response);
  }
}
