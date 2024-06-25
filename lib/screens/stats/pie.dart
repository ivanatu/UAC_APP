import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartPage extends StatelessWidget {
  final dataMap = <String, double>{
    "PLHIV who know their status": 1289028,
    "PLHIV who are on ART": 1210906,
    "PLHIV who have suppressed viral loads": 1134636,
  };

  final colorList =
      List.generate(3, (index) => Colors.primaries[(index * 4) % 10]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 5, 5, 1),
      child: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(
          milliseconds: 500,
        ),
        chartLegendSpacing: 50,
        chartRadius: MediaQuery.of(context).size.width / 1.2,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.disc,
        ringStrokeWidth: 100,
        centerText: "",
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.bottom,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: Theme.of(context).textTheme.labelLarge!.apply(
                fontWeightDelta: 2,
                fontFamily: 'Montserrat',
              ),
        ),
        // ringStrokeWidth: 150,
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          chartValueBackgroundColor: Colors.grey.shade100,
          showChartValues: true,
          // showChartValuesInPercentage: e,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
      ),
    );
  }
}
