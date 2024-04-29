import 'package:auto_size_text/auto_size_text.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../values/default_country_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'cases_progress_bars.dart';
import 'new_case_boxes.dart';
import 'dart:convert';

// ignore: must_be_immutable
class CountryCardDetails extends StatefulWidget {
  Color color;
  int totalCases;
  final countryName, countryCode, isIncreasing;
  final int todayCases;
  final int newDeaths;
  final int critical;
  final int active;
  final int totalDeaths;
  final int totalRecovered;
  final int testsConducted;

  CountryCardDetails(
      {required this.color,
      required this.totalCases,
      required this.countryName,
      required this.countryCode,
      // required this.flagPath,
      required this.isIncreasing,
      required this.todayCases,
      required this.newDeaths,
      required this.critical,
      required this.active,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.testsConducted});

  @override
  _CountryCardDetailsState createState() => _CountryCardDetailsState();
}

class _CountryCardDetailsState extends State<CountryCardDetails>
    with TickerProviderStateMixin {
  AnimationController? _controller1, _controller2;
  Duration? textScaleDuration;
  final formatter = NumberFormat("#,###");
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    textScaleDuration = Duration(milliseconds: 200);
    _controller1 = AnimationController(
        vsync: this,
        duration: textScaleDuration!,
        lowerBound: 0.7,
        upperBound: 1);
    _controller2 = AnimationController(
        vsync: this,
        duration: textScaleDuration!,
        lowerBound: 0.7,
        upperBound: 1);
    _controller1?.forward();
  }

  @override
  void dispose() {
    _controller1?.dispose();
    _controller2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        //Today / Yesterday Title
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
              scale: _controller1!,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                    _controller2?.reverse();
                    _controller1?.forward();
                  });
                },
                child: AutoSizeText(
                  "Today",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight:
                        selectedIndex == 0 ? FontWeight.w700 : FontWeight.w600,
                    color: Colors.grey[800],
                    fontSize: 22.0,
                  ),
                  maxFontSize: 22,
                ),
              ),
            ),
            SizedBox(width: 5),
            ScaleTransition(
              scale: _controller2!,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                    _controller1?.reverse();
                    _controller2?.forward();
                  });
                },
                child: AutoSizeText(
                  "Yesterday",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight:
                        selectedIndex == 0 ? FontWeight.w600 : FontWeight.w700,
                    color: Colors.grey[800],
                    fontSize: 22.0,
                  ),
                  maxFontSize: 22,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        selectedIndex == 0
            ? NewCaseBoxes(
                color: widget.color,
                affected: widget.todayCases,
                deaths: widget.newDeaths,
                recovered: widget.totalRecovered,
                tested: widget.testsConducted,
                totalCases: widget.totalCases,
                today: true,
              )
            : NewCaseBoxes(
                color: widget.color,
                affected: widget.critical,
                deaths: widget.totalDeaths,
                tested: widget.testsConducted,
                totalCases: widget.totalCases,
                recovered: widget.totalRecovered,
                today: false,
              ),

        //New case boxes

        //Total Case Bars
        // selectedIndex == 0
        //     ? CaseBars(
        //         color: widget.color,
        //         totalActive: widget.active,
        //         totalDeaths: widget.totalDeaths,
        //         totalCases: widget.todayCases,
        //         totalRecovered: widget.totalRecovered,
        //       )
        //     : CaseBars(
        //         color: widget.color,
        //         totalActive: widget.active,
        //         totalDeaths: widget.totalDeaths,
        //         totalCases: widget.todayCases,
        //         totalRecovered: widget.totalRecovered,
        //       ),

        // // Expanded(child: SizedBox(height: 35)),

        //Set as default button
        defaultCountry.countryName != widget.countryName
            ? InkWell(
                onTap: () async {
                  defaultCountry.countryName = widget.countryName;
                  defaultCountry.countryCode = widget.countryCode;
                  defaultCountry.color = widget.color.value;
                  // defaultCountry.flagPath = widget.flagPath;
                  defaultCountry.totalCases = widget.todayCases;
                  defaultCountry.isIncreasing = widget.isIncreasing;
                  var jsonMap = defaultCountry.toJson();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("defaultCountry", json.encode(jsonMap));
                  Navigator.of(context).pop();
                  Flushbar(
                    messageText: AutoSizeText(
                      "${widget.countryName} set as default country",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 17,
                          color: Colors.white),
                      maxFontSize: 17,
                    ),
                    flushbarPosition: FlushbarPosition.BOTTOM,
                    flushbarStyle: FlushbarStyle.FLOATING,
                    icon: Icon(
                      Icons.info_outline,
                      size: 28.0,
                      color: widget.color,
                    ),
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                    shouldIconPulse: false,
                    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                    duration: Duration(seconds: 3),
                    leftBarIndicatorColor: widget.color,
                  )..show(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Center(
                    child: AutoSizeText(
                      "Set as default",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxFontSize: 20,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
