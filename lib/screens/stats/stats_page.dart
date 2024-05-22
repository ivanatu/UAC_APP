import "package:aids_awareness_app/screens/stats/widgets/progress_95.dart";
import "package:aids_awareness_app/screens/stats/widgets/stat_widget.dart";

import "/exports/exports.dart";
import "antiretroviral_chart.dart";
import "testing_and_treatment_cascade.dart";

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
        StatWidget(
          nextPage: AntiretroviralTherapyChart(),
          title: "Antiretroviral Therapy ",
          icon: Icons.bar_chart_rounded,
          color: Colors.red,
        ),
        Space(
            // space: 0.051,
            ),
        StatWidget(
          nextPage: HIVTestingAndTreatmentCascade(),
          title: "HIV Testing & Treatment",
          icon: Icons.pie_chart_rounded,
          color: Colors.blue,
        ),
        Space(),
        StatWidget(
          nextPage: ProgressOn95(),
          title: "Progress on 95-95-95",
          icon: Icons.pie_chart_rounded,
          color: Colors.green,
        ),
      ],
    );
  }
}
