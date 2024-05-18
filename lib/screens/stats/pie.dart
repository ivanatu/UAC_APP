import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartPage extends StatelessWidget {
  final dataMap = <String, double>{
    "PLHIV who know their status": 35.47,
    "PLHIV who are on ART": 33.22,
    "PLHIV who have suppressed viral loads": 20,
  };

  final colorList = <Color>[
    Colors.green,
    Colors.yellow,
    Colors.deepOrange,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 10, 5, 1),
      child: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(
          milliseconds: 800,
        ),
        chartLegendSpacing: 30,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 60,
        centerText: "",
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.bottom,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: Theme.of(context).textTheme.bodyMedium!,
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: false,
          showChartValuesInPercentage: true,
          showChartValuesOutside: true,
          decimalPlaces: 1,
        ),
      ),
    );
  }
}