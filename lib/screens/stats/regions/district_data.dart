import 'package:aids_awareness_app/models/regions_model.dart';
import 'package:aids_awareness_app/services/regions_service.dart';
import 'package:pie_chart/pie_chart.dart' as p;
import '/exports/exports.dart';

class DistrictData extends StatefulWidget {
  final Datum region;
  final int index;
  final Color color;
  const DistrictData(
      {super.key,
      required this.region,
      required this.color,
      required this.index});

  @override
  State<DistrictData> createState() => _DistrictDataState();
}

class _DistrictDataState extends State<DistrictData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors
          .primaries[(widget.index * 7) % Colors.primaries.length].shade50,
      appBar: AppBar(
        backgroundColor: widget.color,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          'District Data',
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontWeightDelta: 3,
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
        ),
        elevation: 0,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: constraints.maxHeight * 0.2,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: AutoSizeText(
                  widget.region.attributes.title,
                  style: Theme.of(context).textTheme.headlineLarge!.apply(
                      color: Colors.white,
                      fontWeightDelta: 20,
                      fontSizeFactor: 1.32,
                      fontFamily: 'Montserrat'),
                  minFontSize: 15,
                  maxFontSize: 40,
                ),
              ),
            )
            // plot data for the region
            ,
            FutureBuilder(
              future: RegionService().getDistricts(widget.region.id),
              builder: (context, snapshot) {
                var data = snapshot.data ?? [];
                if (snapshot.hasData) {
                  // plot pie chart
                  return p.PieChart(
                    dataMap: _generateMap(data),
                    colorList: _generateColorList(data.length),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: widget.color,
                    strokeWidth: 10,
                    strokeCap: StrokeCap.butt,
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
  }

  _generateMap(List<Datum> data) {
    Map<String, double> map = {};
    data.forEach((element) {
      map[element.attributes.title] = element.attributes.prevalence;
    });
    return map;
  }

  _generateColorList(int length) {
    List<Color> colors = [];
    for (int i = 0; i < length; i++) {
      colors.add(Colors.primaries[(i * 7) % Colors.primaries.length]);
    }
    return colors;
  }
}
