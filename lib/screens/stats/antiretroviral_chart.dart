import '/exports/exports.dart';
import 'bar_graph_widget.dart';

class AntiretroviralTherapyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Antiretroviral Therapy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BarChartWidget(),
          ],
        ),
      ),
    );
  }
}
