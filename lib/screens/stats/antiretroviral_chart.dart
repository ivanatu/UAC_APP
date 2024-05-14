import 'package:flutter/material.dart';
import 'package:community_charts_flutter/flutter.dart' as charts;

class AntiretroviralTherapyChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  AntiretroviralTherapyChart(this.seriesList, {this.animate = true});

  factory AntiretroviralTherapyChart.withSampleData() {
    return new AntiretroviralTherapyChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  static List<charts.Series<TherapyData, String>> _createSampleData() {
    final data = [
      new TherapyData('Adults & Children', 84, Colors.blue),
      new TherapyData('Adults 15+', 85, Colors.blue),
      new TherapyData('Women 15+', 88, Colors.blue),
      new TherapyData('Men 15+', 80, Colors.blue.shade800),
      new TherapyData('Children 0-14', 72, Colors.blue.shade800),
    ];

    return [
      new charts.Series<TherapyData, String>(
        id: 'Sales',
        colorFn: (TherapyData therapy, _) => therapy.color,
        domainFn: (TherapyData therapy, _) => therapy.category,
        measureFn: (TherapyData therapy, _) => therapy.percentage,
        data: data,
      )
    ];
  }
}

class TherapyData {
  final String category;
  final int percentage;
  final charts.Color color;

  TherapyData(this.category, this.percentage, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
