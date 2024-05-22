import 'package:aids_awareness_app/screens/stats/pie.dart';

import '/exports/exports.dart';

class HIVTestingAndTreatmentCascade extends StatefulWidget {
  const HIVTestingAndTreatmentCascade({super.key});

  @override
  State<HIVTestingAndTreatmentCascade> createState() =>
      _HIVTestingAndTreatmentCascadeState();
}

class _HIVTestingAndTreatmentCascadeState
    extends State<HIVTestingAndTreatmentCascade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HIV Testing & Treatment"),
      ),
      body: Column(
        // padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
        children: [
          Space(
            space: 0.043,
          ),
          SizedBox(
            height: 500,
            child: PieChartPage(),
          ),
        ],
      ),
    );
  }
}
