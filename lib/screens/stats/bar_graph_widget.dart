// import 'package:fl_chart/fl_chart.dart';
// ignore_for_file: must_be_immutable

import '/exports/exports.dart';

class BarChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.92,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 100,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (context) => Colors.blue.shade50,
            ),
            touchCallback: (barTouchResponse, response) {},
            handleBuiltInTouches: true,
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 25,
                showTitles: true,
                // margin: 16,
                getTitlesWidget: (value, v) {
                  switch (value.toInt()) {
                    case 0:
                      return AutoSizeText(
                        'Adults&\nChildren',
                        maxLines: 2,
                        minFontSize: 10,
                        maxFontSize: 14,
                      );
                    case 1:
                      return AutoSizeText(
                        'Adults 15+',
                        minFontSize: 10,
                        maxFontSize: 11,
                      );
                    case 2:
                      return AutoSizeText(
                        'Women 15+',
                        minFontSize: 10,
                        maxFontSize: 11,
                      );
                    case 3:
                      return AutoSizeText(
                        'Men 15+',
                        minFontSize: 10,
                        maxFontSize: 11,
                      );
                    case 4:
                      return AutoSizeText(
                        'Children 0-14',
                        minFontSize: 10,
                        maxFontSize: 11,
                      );
                    case 5:
                      return AutoSizeText(
                        'Sat',
                        minFontSize: 10,
                        maxFontSize: 13,
                      );
                    case 6:
                      return AutoSizeText(
                        'Sun',
                        minFontSize: 10,
                        maxFontSize: 13,
                      );
                    default:
                      return AutoSizeText(
                        '',
                        minFontSize: 10,
                        maxFontSize: 13,
                      );
                  }
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: getData(),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> data = [
    {
      'name': 'Adults & Children',
      'value': 84.0,
      'color': Colors.blue.shade900,
    },
    {
      'name': 'Adults 15+',
      'value': 85.0,
      'color': Colors.blue.shade700,
    },
    {
      'name': 'Women 15+',
      'value': 88.0,
      'color': Colors.blue.shade500,
    },
    {
      'name': 'Men 15+',
      'value': 80.0,
      'color': Colors.blue.shade400,
    },
    {
      'name': 'Children 0-14',
      'value': 72.0,
      'color': Colors.blue.shade300,
    },
  ];
  List<BarChartGroupData> getData() {
    return List.generate(
      data.length,
      (i) => BarChartGroupData(
        x: i,
        barsSpace: 3,
        barRods: [
          BarChartRodData(
            width: 50,
            borderRadius: BorderRadius.zero,
            toY: data[i]['value'],
            fromY: 0,
            color: data[i]['color'],
          )
        ],
        showingTooltipIndicators: [0],
      ),
    );
  }
}
