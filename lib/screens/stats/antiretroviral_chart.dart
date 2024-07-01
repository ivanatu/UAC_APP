import '/exports/exports.dart';
import 'bar_graph_widget.dart';

class AntiretroviralTherapyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          "Antiretroviral Therapy (ART)\nCoverage",
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                fontWeightDelta: 2,
                fontSizeFactor: 1.2,
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 40, 2, 10),
            child: Column(
              children: [
                BarChartWidget(
                  data: [
                    {
                      'name': 'Adults & Children',
                      'value': 84.0,
                      'color': Colors.red.shade900,
                    },
                    {
                      'name': 'Adults 15+',
                      'value': 85.0,
                      'color': Colors.red.shade700,
                    },
                    {
                      'name': 'Women 15+',
                      'value': 88.0,
                      'color': Colors.red.shade500,
                    },
                    {
                      'name': 'Men 15+',
                      'value': 80.0,
                      'color': Colors.red.shade400,
                    },
                    {
                      'name': 'Children 0-14',
                      'value': 72.0,
                      'color': Colors.red.shade300,
                    },
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
