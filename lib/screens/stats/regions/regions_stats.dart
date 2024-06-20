import "../../../models/regions_model.dart";
import "../../../services/regions_service.dart";
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../widgets/widgets/space.dart';

class RegionsStats extends StatefulWidget {
  const RegionsStats({super.key});

  @override
  State<RegionsStats> createState() => _RegionsStatsState();
}

class _RegionsStatsState extends State<RegionsStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Regions Stats",
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
          SafeArea(
            child: LayoutBuilder(builder: (context, constraints) {
              return FutureBuilder<List<Datum>>(
                future: RegionService().getRegions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 10,
                          ),
                        ),
                        Space(
                          space: 0.07,
                        ),
                        Text(
                          "Loading...",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: Colors.grey,
                              ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Card(
                        elevation: 0,
                        color: Colors.red.shade50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Error: ${snapshot.error}",
                              style: TextStyle(
                                color: Colors.red,
                              )),
                        ),
                      ),
                    );
                  } else {
                    // pie chart to visualize the data
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 15, 8, 10),
                      child: PieChart(
                        dataMap: _generateDataMap(snapshot.data),
                        colorList: _generateColorList(snapshot.data!.length),
                        chartRadius: constraints.maxWidth * 0.75,
                        animationDuration: Duration(
                          milliseconds: 2500,
                        ),
                        chartLegendSpacing: constraints.maxWidth * 0.065,
                        initialAngleInDegree: 0,
                        chartType: ChartType.disc,
                        ringStrokeWidth: 120,
                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          showChartValuesInPercentage: true,
                          showChartValuesOutside: false,
                          decimalPlaces: 1,
                        ),
                        legendOptions: LegendOptions(
                          showLegends: true,
                          legendPosition: LegendPosition.bottom,
                          legendShape: BoxShape.circle,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Map<String, double> _generateDataMap(List<Datum>? data) {
    Map<String, double> dataMap = {};
    data!.forEach((element) {
      dataMap[element.attributes.title] = element.attributes.prevalence;
    });
    return dataMap;
  }

  List<Color> _generateColorList(int length) {
    List<Color> colorList = [];
    for (int i = 0; i < length; i++) {
      colorList.add(Colors.primaries[i * 7 % Colors.primaries.length]);
    }
    return colorList;
  }
}
