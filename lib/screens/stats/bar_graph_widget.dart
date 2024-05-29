// import 'package:fl_chart/fl_chart.dart';
// ignore_for_file: must_be_immutable

import '/exports/exports.dart';

class BarChartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final SideTitles? sideTitles;
  final BarChartAlignment? alignment;
  const BarChartWidget(
      {super.key, required this.data, this.sideTitles, this.alignment});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 1.52,
        child: BarChart(
          BarChartData(
            alignment: alignment,
            maxY: 100,
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return null;
                },
              ),
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: sideTitles ??
                    SideTitles(
                      interval: 20,
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
                  showTitles: true,
                  getTitlesWidget: (value, x) {
                    if (value == 0) {
                      return Text('0');
                    } else if (value == 20) {
                      return Text('20');
                    } else if (value == 40) {
                      return Text('40');
                    } else if (value == 60) {
                      return Text('60');
                    } else if (value == 80) {
                      return Text('80');
                    } else if (value == 100) {
                      return Text('100');
                    } else {
                      return Text('');
                    }
                  },
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
            barGroups: getData(data),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData(List<Map<String, dynamic>> data) {
    return List.generate(
      data.length,
      (i) => BarChartGroupData(
        x: i,
        barsSpace: 5,
        barRods: [
          BarChartRodData(
            width: 31.5,
            borderRadius: BorderRadius.zero,
            toY: data[i]['value'],
            fromY: 0,
            color: data[i]['color'],
          )
        ],
        showingTooltipIndicators: [0, 7],
      ),
    );
  }
}
