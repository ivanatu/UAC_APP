import 'package:uac/apis/api_helper.dart';

import '../models/prevalence_regions.dart';
import '../models/regions_model.dart';
import '/exports/exports.dart';

class RegionService {
  ApiHelper apiHelper = ApiHelper();
  // function to retrieve regions p3aCe@RPC
  Future<List<Datum>> getRegions() async {
    try {
      var response = await Client().get(Uri.parse(Apis.regions));
      if (response.statusCode == 200) {
        String result = response.body;
        // debugPrint(result);
        return regionModelFromJson(result).data;
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } on Exception catch (e, stackTrace) {
      print('Error: $stackTrace');
      return Future.error('Error: $e');
    }
  }

  // function to retrieve districts from selected regions
  Future<List<Datum>> getDistricts(int regionId) async {
    List<Datum> regions = await getRegions();
    return regions
        .firstWhere((element) => element.id == regionId)
        .attributes
        .districts!
        .data;
  }

  // modified prevalence regions function
  Future<List<PrevalenceRegion>> getPrevalenceRegions() async {
    var response = await apiHelper.get("prevalence-regions?populate=*");
    return PrevalenceRegionsResponse.fromJson(response).data;
  }
}
