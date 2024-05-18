import '/exports/exports.dart';

class LineChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.black, width: 1),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.black,
                    strokeWidth: 0.5,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.black,
                    strokeWidth: 0.5,
                  );
                },
              ),
              titlesData: FlTitlesData(
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: true)),
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: true)),
              ),
              minX: 0,
              maxX: 7,
              minY: 0,
              maxY: 6,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 3),
                    FlSpot(1, 1),
                    FlSpot(2, 4),
                    FlSpot(3, 3),
                    FlSpot(4, 5),
                    FlSpot(5, 3),
                    FlSpot(6, 4),
                  ],
                  isCurved: true,
                  // colors: [Colors.blue],
                  barWidth: 4,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
