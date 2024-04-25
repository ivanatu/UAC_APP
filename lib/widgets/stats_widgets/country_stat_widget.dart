import 'package:aids_awareness_app/values/default_country_data.dart';
import '../../widgets/stats_widgets/country_card_details.dart';
import '../../network_requests/exceptions.dart';
import '../../widgets/skeletons/country_stat_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';

// ignore: must_be_immutable
class CountryStatWidget extends StatefulWidget {
  final color, countryName, countryCode, isIncreasing, totalCases;
  Function onBackArrow;
  final int todayCases;
  final int newDeaths;
  final int critical;
  final int active;
  final int totalDeaths;
  final int totalRecovered;
  final int testsConducted;

  CountryStatWidget({
    Key key,
    this.color,
    this.onBackArrow,
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
    this.testsConducted,
  }) : super(key: key);

  @override
  _CountryStatWidgetState createState() => _CountryStatWidgetState();
}

class _CountryStatWidgetState extends State<CountryStatWidget>
    with TickerProviderStateMixin {
  AnimationController _controller1, _controller2;
  Duration textScaleDuration;
  final formatter = new NumberFormat("#,###");
  int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    textScaleDuration = Duration(milliseconds: 200);
    _controller1 = AnimationController(
      vsync: this,
      duration: textScaleDuration,
      lowerBound: 0.7,
      upperBound: 1,
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: textScaleDuration,
      lowerBound: 0.7,
      upperBound: 1,
    );
    _controller1.forward();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Stack(
        children: <Widget>[
          //Country Details
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //Flag and Name and More
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Back Button
                      InkWell(
                        onTap: () {
                          widget.onBackArrow();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0x99FFFFFF),
                              width: 1.8,
                            ),
                          ),
                          margin: const EdgeInsets.only(left: 20),
                          padding: const EdgeInsets.all(7),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0x99FFFFFF),
                            size: 21,
                          ),
                        ),
                      ),

                      //Name and flag
                      Flexible(
                        fit: FlexFit.loose,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Flag
                            Flexible(
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4.5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFA90A0),
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  // child: Image.asset(
                                  //   widget.flagPath,
                                  //   width: 32,
                                  // ),
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

                            //Country Name
                            Flexible(
                              flex: 2,
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6, left: 4),
                                child: AutoSizeText(
                                  widget.countryName,
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxFontSize: 22,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //More Icon
                      Padding(
                        padding: const EdgeInsets.only(right: 13, top: 3),
                        child: InkWell(
                          child: const Icon(
                            Icons.more_horiz,
                            color: Colors.white60,
                            size: 30,
                          ),
                          onTap: () {},
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  //Number of Cases
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Number
                        _buildCasesText(),

                        SizedBox(
                          width: 10,
                        ),

                        //Arrow
                        Icon(
                          widget.isIncreasing
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: Colors.white,
                          size: 28,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //White Details Card
          Positioned(
            top: 150,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: _buildCountryCardDetails(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCasesText() {
    if (widget.todayCases != null) {
      return AutoSizeText(
        formatter.format(widget.todayCases),
        style: TextStyle(
          fontFamily: "Montserrat",
          color: Colors.white,
          fontSize: 37,
          letterSpacing: 1.1,
          fontWeight: FontWeight.w600,
        ),
        maxFontSize: 37,
      );
    } else {
      return AutoSizeText(
        formatter.format(widget.totalCases),
        style: TextStyle(
          fontFamily: "Montserrat",
          color: Colors.white,
          fontSize: 37,
          letterSpacing: 1.1,
          fontWeight: FontWeight.w600,
        ),
        maxFontSize: 37,
      );
    }
  }

  Widget _buildCountryCardDetails() {
    if (defaultCountry.countryName == widget.countryName) {
      return CountryStatLoader(
        color: widget.color,
        isDefault: true,
      );
    } else {
      return CountryCardDetails(
        countryName: widget.countryName,
        countryCode: widget.countryCode,
        // flagPath: widget.flagPath,
        isIncreasing: widget.isIncreasing,
        totalCases: widget.totalCases,
        todayCases: widget.todayCases,
        newDeaths: widget.newDeaths,
        critical: widget.critical,
        active: widget.active,
        totalDeaths: widget.totalDeaths,
        totalRecovered: widget.totalRecovered,
        testsConducted: widget.testsConducted,
      );
    }
  }
}
