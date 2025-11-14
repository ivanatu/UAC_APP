import 'package:uac/apis/api_helper.dart';
import 'package:uac/models/testing_cascade_response.dart';

class TestingCascadeService {
  ApiHelper apiHelper = ApiHelper();
  Future<List<TestingCascade>> getTestingCascade() async {
    var response = await apiHelper.get("hiv-testing-and-treatment-cascade");
    return TestingCascadeResponse.fromJson(response).data;
  }
}
