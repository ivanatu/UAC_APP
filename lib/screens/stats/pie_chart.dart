import '/exports/exports.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: getSections(),
        centerSpaceRadius: 40,
        // startDegreeOffset: 180,
        borderData: FlBorderData(show: true),
        sectionsSpace: 1,
      ),
    );
  }

  List<PieChartSectionData> getSections() {
    return [
      PieChartSectionData(
        color: Colors.blue,
        value: 40,
        title: '40%',
        // radius: 120,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 30,
        title: '30%',
        // radius: 100,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 20,
        title: '20%',
        // radius: 90,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.yellow,
        value: 10,
        title: '10%',
        // radius: 70,
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }
}
