import "package:aids_awareness_app/screens/stats/pie_chart.dart";

import "/exports/exports.dart";
import "bar_graph_widget.dart";
import "pie.dart";

// // import '../../widgets/home_page_widgets/home_categories.dart';
// import "./antiretroviral_chart.dart";
class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "\nStats",
                style: Theme.of(context).textTheme.headlineLarge!.apply(
                      fontWeightDelta: 10,
                    ),
              ),
            ],
          ),
          // Showcase antiretroviral_chart
        ),
        Space(
          space: 0.043,
        ),
        Text(
          "Antiretroviral Therapy",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(fontWeightDelta: 2, fontSizeDelta: 3),
        ),
        Space(
          space: 0.1,
        ),
        BarChartWidget(),
        Space(
          space: 0.051,
        ),
        Text(
          "HIV Testing and Treatment Cascade",
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                fontWeightDelta: 2,
                fontSizeDelta: 2,
              ),
        ),
        // pie chart
        SizedBox(
          height: 280,
          child: PieChartPage(),
        ),

        Text(
          "Progress on 95-95-95",
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                fontWeightDelta: 2,
                fontSizeDelta: 2,
              ),
        ),
        Space(
          space: 0.05,
        ),
        FittedBox(
          child: SizedBox(
            height: 140,
            child: PieChartWidget(
              data: List.generate(
                3,
                (index) => PieChartSectionData(
                  color: Colors.blue,
                  value: 40,
                  title: '40%',
                  radius: 120,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
