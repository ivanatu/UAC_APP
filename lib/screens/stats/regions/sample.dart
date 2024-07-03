import '/controllers/regional_controller.dart';
import '/exports/exports.dart';
import 'package:latlong2/latlong.dart';

class UgandaMapPage extends StatefulWidget {
  @override
  _UgandaMapPageState createState() => _UgandaMapPageState();
}

class _UgandaMapPageState extends State<UgandaMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uganda HIV Prevalence Map'),
      ),
      body: Consumer<RegionalController>(
        builder: (context, controller, child) {
          if (mounted) {
            controller.parseGeoJson();
            print(controller.dataMap);
          }
          return FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(1.3733, 32.2903),
              initialZoom: 7.0,
            ),
            children: [
              ..._buildLabels(),
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              PolygonLayer(polygons: controller.regions),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Prevalence Key'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildKeyItem(Colors.yellow, '60.3% - 67.3%'),
                    _buildKeyItem(Colors.orange, '67.4% - 75.5%'),
                    _buildKeyItem(Colors.deepOrange, '75.6% - 82.7%'),
                    _buildKeyItem(Colors.red, '82.8% and above'),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.info),
      ),
    );
  }

  List<Widget> _buildLabels() {
    List<Widget> labels = [];
    Provider.of<RegionalController>(context)
        .dataMap
        .forEach((regionName, prevalence) {
      final LatLng center = _getRegionCenter(regionName);
      labels.add(Positioned(
        left: center.longitude,
        top: center.latitude,
        child: Text(
          '$regionName\n$prevalence%',
          style: TextStyle(
              color: Colors.black, fontSize: 12, backgroundColor: Colors.white),
          textAlign: TextAlign.center,
        ),
      ));
    });
    return labels;
  }

  LatLng _getRegionCenter(String regionName) {
    // Add logic to calculate the center of the region based on the GeoJSON data.
    // For simplicity, returning a static point. Replace with actual calculation.
    return LatLng(1.3733, 32.2903);
  }

  Widget _buildKeyItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        SizedBox(width: 10),
        Text(label),
      ],
    );
  }
}
