import '../models/precaution_model.dart';
import "/exports/exports.dart";

class PrecautionService {
  static Future<List<Datum>> getPrecaution() async {
    try {
      final response = await Client().get(Uri.parse(Apis.precautions));
      if (response.statusCode == 200) {
        final List<Datum> precautionList =
            precautionModelFromJson(response.body).data;
        return precautionList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
