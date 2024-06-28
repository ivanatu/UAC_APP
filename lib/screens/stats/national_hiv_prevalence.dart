import 'package:aids_awareness_app/controllers/national_prevalence_controller.dart';
import 'package:pie_chart/pie_chart.dart';

import '/exports/exports.dart';
import 'widgets/pie_widget.dart';

class NationalHivPrevalence extends StatefulWidget {
  const NationalHivPrevalence({super.key});

  @override
  State<NationalHivPrevalence> createState() => _NationalHivPrevalenceState();
}

class _NationalHivPrevalenceState extends State<NationalHivPrevalence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
        title: Text("National HIV Prevalence"),
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.apply(
              fontWeightDelta: 3,
              color: Colors.white,
              fontFamily: 'Montserrat',
            ),
      ),
      body: Stack(
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Consumer<NationalPrevalenceController>(
              builder: (context, controller, x) {
            if (mounted) {
              controller.fetchNationalPrevalence();
            }
            return controller.loading
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      valueColor: AlwaysStoppedAnimation(Colors.purple),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Prevalence in %",
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              fontWeightDelta: 2,
                              color: Colors.purple,
                              fontFamily: 'Montserrat',
                            ),
                      ),
                      Space(
                        space: 0.3,
                      ),
                      PieWidget(
                        radius: 800,
                        position: LegendPosition.right,
                        colorList: _generateColorList(controller.items.length),
                        dataMap: {
                          for (var item in controller.items)
                            item.attributes.title: item.attributes.value
                        },
                        text: "in %",
                        showPercentage: false,
                        dps: 2,
                      ),
                    ],
                  );
          })
        ],
      ),
    );
  }

  List<Color> _generateColorList(int length) {
    List<Color> colorList = [];
    for (int i = 0; i < length; i++) {
      colorList.add(Colors.primaries[i * 7 % Colors.primaries.length]);
    }
    return colorList;
  }
}
