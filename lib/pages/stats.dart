import 'package:flutter/material.dart';
import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'rectangle.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AIDS Statistics"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Status of The National HIV \nAnd Aids Response in Uganda",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            Text("As of December 2021"),
            SizedBox(
              height: 7,
            ),
            Text(
              "New HIV Infections",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            chart(16000.0, 6000, 3100),
            SizedBox(
              height: 7,
            ),
            Text(
              "New HIV Infections",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            chart(16000.0, 6000, 3100),
            SizedBox(
              height: 7,
            ),
            Text(
              "New HIV Infections",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            chart(16000.0, 6000, 3100),
            SizedBox(
              height: 7,
            ),
            Text(
              "95-95-95 targets",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(
              height: 7,
            ),
            Row(children: [
              indicator(0.89, "Know Status"),
              SizedBox(
                width: 10,
              ),
              indicator(0.89, "Received ART"),
              SizedBox(
                width: 10,
              ),
              indicator(0.70, "Weekly Suppresed"),
            ])
          ]),
        ),
      ),
    );
  }

  CircularPercentIndicator indicator(double value, String info) {
    return CircularPercentIndicator(
      radius: 45.0,
      lineWidth: 13.0,
      animation: true,
      percent: value,
      center: new Text(
        (value * 100).toString(),
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      footer: new Text(
        info,
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.purple,
    );
  }

  Row chart(double Q1, double Q2, double Q3) {
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();

    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(Q1, Colors.blue, rankKey: 'Q1'),
          new CircularSegmentEntry(Q2, Colors.green, rankKey: 'Q2'),
          new CircularSegmentEntry(Q3, Colors.red, rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
    return Row(
      children: [
        AnimatedCircularChart(
          key: _chartKey,
          size: const Size(100.0, 100.0),
          initialChartData: data,
          chartType: CircularChartType.Pie,
        ),
        Column(
          children: [
            Row(children: [
              CustomPaint(painter: Rectangle(color: Colors.blue)),
              SizedBox(
                width: 30,
              ),
              Text("Men (15+)")
            ]),
            Text(
              "16000",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              CustomPaint(painter: Rectangle(color: Colors.red)),
              SizedBox(
                width: 30,
              ),
              Text("Men (15+)")
            ]),
            const Text(
              "16000",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: [
            Row(children: [
              CustomPaint(painter: Rectangle(color: Colors.green)),
              SizedBox(
                width: 30,
              ),
              Text("Men (15+)")
            ]),
            const Text(
              "16000",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              CustomPaint(painter: Rectangle(color: Colors.black)),
              SizedBox(
                width: 30,
              ),
              Text("Men (15+)")
            ]),
            const Text(
              "16000",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
