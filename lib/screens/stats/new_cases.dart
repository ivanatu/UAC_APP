import 'package:aids_awareness_app/models/cases_model.dart';

import '/services/cases_service.dart';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class NewCasesPage extends StatefulWidget {
  const NewCasesPage({super.key});

  @override
  State<NewCasesPage> createState() => _NewCasesPageState();
}

class _NewCasesPageState extends State<NewCasesPage> {
  String year = "2010";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackButton(
          color: Colors.white,
        ),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("2010"),
                    value: "2010",
                  ),
                  PopupMenuItem(
                    child: Text("2022"),
                    value: "2022",
                  ),
                ];
              },
              onSelected: (value) {
                setState(() {
                  year = value.toString();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      year,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 2,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              )),
        ],
        title: Text(
          "New Cases",
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                fontWeightDelta: 2,
                fontSizeFactor: 1.4,
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight * 0.048,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                  future: CasesService.fetchCases(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          strokeCap: StrokeCap.butt,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        "Error: ${snapshot.error}",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              fontWeightDelta: 2,
                              fontFamily: 'Montserrat',
                            ),
                      ));
                    } else {
                      final cases = snapshot.data
                              ?.where(
                                (element) => element.attributes.year == year,
                              )
                              .toList() ??
                          [];
                      // compute percentages for total cases
                      // Set.from(

                      // ).toList();
                      int totalCases = cases.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + element.attributes.data);
                      // cases.forEach((element) {
                      //   element.attributes.data = (element.attributes.data / totalCases * 100).round();
                      // });
                      // draw a pie chart;
                      return PieChart(
                        dataMap: _generateData(cases, totalCases),
                        colorList: _generateColors(cases),
                        legendOptions: LegendOptions(
                          showLegends: true,
                          legendPosition: LegendPosition.bottom,
                          legendTextStyle:
                              Theme.of(context).textTheme.labelLarge!.apply(
                                    fontWeightDelta: 2,
                                    fontFamily: 'Montserrat',
                                  ),
                        ),
                      );
                    }
                  }),
            ),
          ],
        );
      }),
    );
  }

  _generateData(List<Datum> cases, int total) {
    final dataMap = <String, double>{};
    cases.forEach((element) {
      dataMap[element.attributes.title] =
          ((element.attributes.data / total * 100));
    });
    return dataMap;
  }

  // generate a list of colors
  List<Color> _generateColors(List<Datum> cases) {
    final colors = <Color>[];
    for (var i = 0; i < cases.length; i++) {
      colors.add(Colors.primaries[(i * 7) % cases.length]);
    }
    return colors;
  }
}
