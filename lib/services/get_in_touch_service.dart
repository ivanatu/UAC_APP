import 'package:uac/apis/api_helper.dart';

import '../models/get_in_touch_model.dart';

class GetInTouchService {
  static ApiHelper _apiHelper = ApiHelper();
  // fetch contact details
  static Future<GetInTouchData> fetchContactDetails() async {
    // implement fetch logic here
    var response = await _apiHelper.get('get-in-touch');
    var result = GetInTouchModel.fromJson(response);
    return result.data;
  }
}
