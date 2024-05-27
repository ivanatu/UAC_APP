import 'package:aids_awareness_app/exports/exports.dart';
import 'package:aids_awareness_app/screens/myth_details_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class MythsScreen extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );

  final imgPath;

  final Color color;

  List<Map<String, String>> myths = [
    {
      "myth":
          "HIV can be spread through tears, sweat, mosquitoes, pools, or casual contact.",
      "desc":
          "HIV is only transmitted through infected blood, semen, vaginal fluids, and breast milk.",
      "imgPath": "assets/myths/mosquito.png",
    },
    {
      "myth": "HIV is a death sentence.",
      "desc":
          "HIV is an easily treatable, long-term medical condition. A person living with HIV can lead a long and healthy life if they take their medication consistently.",
      "imgPath": "assets/myths/hot.png",
    },
    {
      "myth": "I am on PrEP. I don’t need to use condoms.",
      "desc":
          "PrEP is a pill that reduces the risk of getting HIV, but it does not protect against other sexually transmitted infections (STIs) or pregnancy. Condoms are still recommended to prevent STIs and pregnancy.",
      "imgPath": "assets/myths/garlic.png",
    },
    {
      "myth": "You can get HIV from a toilet seat.",
      "desc":
          "HIV cannot be transmitted through contact with toilet seats or other surfaces.",
      "imgPath": "assets/myths/antibiotics.png",
    },
    {
      "myth": "You can get HIV from a mosquito bite.",
      "desc": "HIV CANNOT be transmitted through mosquito bites.",
      "imgPath": "assets/myths/package.png",
    },
    {
      "myth": "You can get HIV from a blood transfusion.",
      "desc":
          "Blood transfusions in the United States are very safe. All donated blood is tested for HIV and other viruses before it is used.",
      "imgPath": "assets/myths/bloodTransfusion.png",
    },
    {
      "myth":
          "You can get HIV from sharing a drinking glass or eating utensils with someone who has HIV.",
      "desc": "HIV is not spread through saliva.",
      "imgPath": "assets/myths/ages.png",
    },
  ];

  MythsScreen({Key? key, this.imgPath, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: color,
              size: 28,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          //Cover Image Container
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              color: color.withOpacity(0.2),
            ),
            width: MediaQuery.of(context).size.width,
            child: LayoutBuilder(
              builder: (ctx, constraint) => Stack(
                children: <Widget>[
                  //Title
                  Positioned(
                    top: constraint.maxHeight * 0.45,
                    left: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: constraint.maxWidth * 0.55,
                        child: AutoSizeText(
                          "Virus Myths",
                          style: TextStyle(
                            color: color,
                            fontFamily: "Montserrat",
                            fontSize: 31,
                            fontWeight: FontWeight.w700,
                          ),
                          stepGranularity: 1,
                          maxFontSize: 31,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),

                  //         //Image
                  Positioned.fill(
                    bottom: -17.0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                            tag: imgPath,
                            child: Image(
                              image: AssetImage(imgPath),
                              height: constraint.maxHeight * 0.93,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Myth card
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                controller: controller,
                physics: PageScrollPhysics(),
                itemCount: myths.length,
                itemBuilder: (context, index) {
                  return Routes.animateTo(
                    openWidget: MythDetailsPage(
                      tag: "$index",
                      myth: "${myths[index]['desc']}",
                      img: '${myths[index]["imgPath"]}',
                      title: '${myths[index]["myth"]}',
                    ),
                    closedWidget: Container(
                      margin: const EdgeInsets.fromLTRB(2, 0, 3, 0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: LayoutBuilder(
                        builder: (ctx, constraint) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Image.asset(
                                "${myths[index]["imgPath"]}",
                                height: constraint.maxHeight * 0.5,
                              ),
                            ),
                            SizedBox(
                              height: constraint.maxHeight * 0.11,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: AutoSizeText(
                                "${myths[index]["myth"]}",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.1,
                                  fontFamily: "Montserrat",
                                  // color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxFontSize: 20,
                                stepGranularity: 2,
                                maxLines: 2,
                              ),
                            ),
                            // SizedBox(
                            //   height: 13,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
