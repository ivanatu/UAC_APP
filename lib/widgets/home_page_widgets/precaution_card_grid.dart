import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PrecautionCardGrid extends StatefulWidget {
  @override
  _PrecautionCardGridState createState() => _PrecautionCardGridState();
}

class _PrecautionCardGridState extends State<PrecautionCardGrid> {
  int selectedIndex = 0;
  final List<Map<String, String>> preventions = const [
    {
      "prevention": "Abstinence",
      "desc":
          "Abstinence means not having sex. It is the most effective way to prevent HIV and other sexually transmitted infections (STIs)",
      "imgPath": "assets/prevention/stop.png",
    },
    {
      "prevention": "Never sharing needles",
      "desc":
          "Never sharing needles means not sharing needles with anyone. This is important because HIV can be spread through the sharing of needles or other injection equipment",
      "imgPath": "assets/prevention/neddles.png",
    },
    {
      "prevention": "HIV medicines",
      "desc":
          "Taking advantage of HIV prevention medicines such as pre-exposure prophylaxis (PrEP) and post-exposure prophylaxis (PEP)12",
      "imgPath": "assets/prevention/coughCover.png",
    },
    {
      "prevention": "Barrier methods for STIs",
      "desc":
          "Practice safe sex by using a barrier method during sex. Condoms provide a type of barrier method to prevent the transmission of HIV and other STIs3",
      "imgPath": "assets/prevention/sanitizer.png",
    },
    // {
    //   "prevention": "No Face Touching",
    //   "desc": "Don't touch your eyes, nose or mouth often and with unwashed hands.",
    //   "imgPath": "assets/prevention/touch.png",
    // },
    // {
    //   "prevention": "Social Distancing",
    //   "desc":
    //   "Keep 7m distance from other people. Stay at home and avoid gatherings.",
    //   "imgPath": "assets/prevention/socialDistance.png",
    // },
  ];

  static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.0,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 15.0,
          crossAxisCount: 2,
          childAspectRatio: 0.70,
        ),
        scrollDirection: Axis.vertical,
        itemCount: preventions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Material(
              borderRadius: BorderRadius.circular(15.0),
              elevation: 5,
              child: AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 650),
                decoration: BoxDecoration(
                  color:
                      index == selectedIndex ? Colors.teal[50] : Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
                child: LayoutBuilder(
                  builder: (ctx, constraint) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image(
                        image: AssetImage(preventions[index]["imgPath"]!),
                        height: constraint.maxHeight * 0.46,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight * 0.1,
                        child: AutoSizeText(
                          "${preventions[index]["prevention"]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          maxFontSize: 14,
                          maxLines: 1,
                          minFontSize: 11,
                          stepGranularity: 1,
                          group: titleGrp,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight * 0.30,
                        child: AutoSizeText(
                          "${preventions[index]['desc']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          maxFontSize: 12,
                          minFontSize: 9,
                          group: descGrp,
                          stepGranularity: 1,
                          maxLines: 4,
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
