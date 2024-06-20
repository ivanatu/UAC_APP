import '/screens/stats/pie.dart';

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
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "HIV Testing & Treatment",
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                fontWeightDelta: 4,
                fontSizeFactor: 1.1,
                fontFamily: 'Montserrat',
              ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Column(
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
        ],
      ),
    );
  }
}
