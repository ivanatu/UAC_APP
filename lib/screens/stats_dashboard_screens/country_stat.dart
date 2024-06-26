import '../../widgets/stats_widgets/country_stat_widget.dart';
import 'package:flutter/material.dart';

class CountryStatScreen extends StatefulWidget {
  final color, countryName, countryCode, isIncreasing, totalCases;
  final int todayCases;
  final int newDeaths;
  final int critical;
  final int active;
  final int totalDeaths;
  final int totalRecovered;
  final int testsConducted;

  const CountryStatScreen(
      {Key key,
      this.color,
      this.countryName,
      this.countryCode,
      // this.flagPath,
      this.isIncreasing,
      this.totalCases,
      this.todayCases,
      this.newDeaths,
      this.critical,
      this.active,
      this.totalDeaths,
      this.totalRecovered,
      this.testsConducted})
      : super(key: key);

  @override
  _CountryStatScreenState createState() => _CountryStatScreenState();
}

class _CountryStatScreenState extends State<CountryStatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: CountryStatWidget(
          color: widget.color,
          onBackArrow: () {
            Navigator.of(context).pop();
          },
          countryCode: widget.countryCode,
          countryName: widget.countryName,
          totalCases: widget.totalCases,
          // flagPath: widget.flagPath,
          isIncreasing: widget.isIncreasing,
          active: widget.active,
          critical: widget.critical,
          newDeaths: widget.newDeaths,
          testsConducted: widget.testsConducted,
          todayCases: widget.todayCases,
          totalDeaths: widget.totalDeaths,
          totalRecovered: widget.totalRecovered,
        ),
      ),
    );
  }
}
