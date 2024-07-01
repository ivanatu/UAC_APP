import '../exports/exports.dart';
import '../models/national_prevalence_model.dart';

class NationalPrevalenceService {
  Future<List<Datum>> getNationalPrevalence() async {
    try {
      var request = Request('GET', Uri.parse(Apis.nationalPrevalence));
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return nationalPrevalenceModelFromJson(
                await response.stream.bytesToString())
            .data;
      } else {
        return Future.error(response.reasonPhrase ?? "");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
