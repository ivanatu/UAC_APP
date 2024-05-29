import 'package:aids_awareness_app/screens/stats/widgets/pie_widget.dart';
import 'package:pie_chart/pie_chart.dart';

import '/exports/exports.dart';

class ProgressOn95 extends StatefulWidget {
  const ProgressOn95({super.key});

  @override
  State<ProgressOn95> createState() => _ProgressOn95State();
}

class _ProgressOn95State extends State<ProgressOn95> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          "Progress on 95-95-95",
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontFamily: 'Montserrat',
                fontWeightDelta: 4,
                color: Colors.white,
              ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
            children: [
              Space(
                space: 0.043,
              ),
              // Text("Know HIV status"),
              PieWidget(
                position: LegendPosition.bottom,
                dataMap: {
                  'Know HIV status': 90.ceilToDouble(),
                  'Other': 10,
                },
                colorList: [
                  Colors.brown.shade500,
                  Colors.deepOrange.shade100,
                ],
              ),
              Space(
                space: 0.063,
              ),
              PieWidget(
                position: LegendPosition.bottom,
                dataMap: {
                  'On Art': 94.ceilToDouble(),
                  'Other': 6,
                },
                colorList: [
                  Theme.of(context).primaryColor.withAlpha(255),
                  Colors.deepOrange.shade100,
                ],
              ),
              Space(
                space: 0.063,
              ),
              PieWidget(
                position: LegendPosition.bottom,
                dataMap: {
                  'Are Virally Suppressed': 94.ceilToDouble(),
                  'Other': 6,
                },
                colorList: [
                  Colors.deepOrange,
                  Colors.yellow,
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
