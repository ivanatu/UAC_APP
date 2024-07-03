import 'dart:developer';

import 'package:latlong2/latlong.dart';

import '../services/regions_service.dart';
import '/exports/exports.dart';

class RegionalController with ChangeNotifier {
  Map<String, dynamic> _dataMap = {};
  Map<String, dynamic> get dataMap => _dataMap;
  // regions
  List<Polygon> _regions = [];
  List<Polygon> get regions => _regions;
  List<LatLng> ugandaRegions = [
    LatLng(3.0333, 31.3333), // West Nile - Arua
    LatLng(2.7746, 32.2988), // Mid Northern - Gulu
    LatLng(2.4704, 33.6208), // North East - Moroto
    LatLng(1.4870, 32.8400), // Mid Eastern - Soroti
    LatLng(0.4591, 33.2043), // East Central - Jinja
    LatLng(1.2455, 31.0402), // Mid Western - Hoima
    LatLng(0.3476, 32.5825), // Kampala
    LatLng(0.3476, 32.5825), // Central 1 - Kampala
    LatLng(-0.6057, 30.6580), // South Western - Kabale
    LatLng(0.3476, 32.5825), // Central 2 - Kampala
  ];
  void parseGeoJson() {
    RegionService().getRegions().then((data) {
      data.forEach((element) {
        _dataMap[element.attributes.title] = element.attributes.prevalence;
        notifyListeners();
      });
    });

    // attach regions to regions
    for (int index = 0; index < dataMap.keys.length; index++) {
      String reg = dataMap.keys.elementAt(index);
      final prevalence = dataMap[reg];
      final color = getColorForPrevalence(prevalence);
      final coordinates = [ugandaRegions[index]];
      regions.add(
        Polygon(
          points: coordinates,
          color: color.withOpacity(0.5),
          borderColor: color,
          borderStrokeWidth: 1.0,
        ),
      );
    }
    log('Regions: ${regions.length}');

    // notifyListeners();
  }

  Color getColorForPrevalence(double prevalence) {
    if (prevalence < 3.0) return Colors.yellow; // Prevalence below 3.0
    if (prevalence < 5.0)
      return Colors.orange; // Prevalence between 3.0 and 4.99
    if (prevalence < 7.0)
      return Colors.deepOrange; // Prevalence between 5.0 and 6.99
    return Colors.red; // Prevalence 7.0 and above
  }
}
