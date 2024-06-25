import '/exports/exports.dart';
import 'package:pie_chart/pie_chart.dart' as pie;

class PieWidget extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colorList;
  final String text;
  final double radius;
  final bool showPercentage;
  final int dps;
  final pie.LegendPosition position;
  const PieWidget({
    super.key,
    this.text = '',
    required this.dataMap,
    required this.colorList,
    required this.position,
    this.radius = 120,
    this.dps = 0,
    this.showPercentage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: pie.PieChart(
        dataMap: dataMap,
        animationDuration: Duration(
          milliseconds: 2500,
        ),
        chartLegendSpacing: 10,
        chartRadius: MediaQuery.of(context).size.width,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: pie.ChartType.disc,
        ringStrokeWidth: 5,
        centerText: text,
        legendOptions: pie.LegendOptions(
          showLegendsInRow: false,
          legendPosition: position,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: Theme.of(context).textTheme.bodyLarge!.apply(
                fontWeightDelta: 2,
              ),
        ),
        chartValuesOptions: pie.ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: showPercentage,
          showChartValuesOutside: false,
          decimalPlaces: dps,
        ),
      ),
    );
  }
}
