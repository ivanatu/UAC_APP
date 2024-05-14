import "/exports/exports.dart";
// import '../../widgets/home_page_widgets/home_categories.dart';
import "./antiretroviral_chart.dart";
class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AntiretroviralTherapyChart.withSampleData(),
      ),
    );
  }
}
