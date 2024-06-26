import "package:aids_awareness_app/screens/stats/new_cases.dart";
import "package:aids_awareness_app/screens/stats/regions/district_stats.dart";
import "package:aids_awareness_app/screens/stats/regions/regions_stats.dart";
import "package:aids_awareness_app/screens/stats/widgets/progress_95.dart";
import "package:aids_awareness_app/screens/stats/widgets/stat_widget.dart";

import "/exports/exports.dart";
import "antiretroviral_chart.dart";
import "stats_dashboard_screens/country_list.dart";
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
      padding: EdgeInsets.fromLTRB(7, 0, 7, 10),
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: " Stats",
                style: Theme.of(context).textTheme.headlineLarge!.apply(
                      fontWeightDelta: 10,
                      fontFamily: 'Montserrat',
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
        StatWidget(
          nextPage: HIVTestingAndTreatmentCascade(),
          title: "HIV Testing & Treatment",
          icon: Icons.pie_chart_rounded,
          color: Colors.blue,
        ),
        StatWidget(
          nextPage: ProgressOn95(),
          title: "Progress on 95-95-95",
          icon: Icons.pie_chart_rounded,
          color: Colors.green,
        ),
        StatWidget(
          nextPage: RegionsStats(),
          title: "Reginal Prevalence Rate",
          icon: Icons.pie_chart_rounded,
          color: Colors.orange,
        ),
        StatWidget(
          nextPage: DistrictStats(),
          title: "District Prevalence Rate (15-49)",
          icon: Icons.pie_chart_rounded,
          color: Colors.cyan,
        ),
        StatWidget(
          nextPage: NewCasesPage(),
          title: "HIV AIDS Burden",
          icon: Icons.pie_chart_rounded,
          color: Colors.blue,
        ),
      ],
    );
  }
}
