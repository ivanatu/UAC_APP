import 'package:uac/apis/api_helper.dart';

import '../models/annual_aids_response.dart';
import '../models/hiv_year_model.dart';
import '../models/new_number_of_infection_model.dart';
import '../models/plhiv_prevalence.dart';

class HivBurdenService {
  ApiHelper _apiHelper = ApiHelper();
  // plhiv prevalence
  Future<List<Plhiv>> getPlhivPrevalence() async {
    var response = await _apiHelper.get(
      'number-of-plhiv-disaggregated-by-age-group-and-sexes?populate=*',
    );
    return PlhivResponse.fromJson(response).data;
  }

  // new infections by sub-region
  Future<List<NewNumberOfInfections>> getNewInfectionsBySubRegion() async {
    var response = await _apiHelper.get(
      'new-number-of-infections-by-age-group-and-sexes?populate=*',
    );
    return NewNumberOfInfectionResponse.fromJson(response).data;
  }

  // annual new infections
  Future<List<AnnualAids>> getAnnualNewInfections() async {
    var response = await _apiHelper.get(
      'annual-ai-ds-related-deaths-by-sex-and-age-groups',
    );
    return AnnaulAidsResponse.fromJson(response).data;
  }

  // get hiv year
  Future<HivYearData> getHivYear() async {
    var response = await _apiHelper.get('hiv-burden-year');
    var result = HivYearModel.fromJson(response);
    return result.data;
  }
}
