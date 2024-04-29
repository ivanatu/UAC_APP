import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatefulWidget {
  @override
  _MessageCardState createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  int selectedIndex = 0;
  final List<Map<String, String>> messages = const [
    {
      "prevention": "LEADERS",
      "desc": "Let us uphold the rights of People living with HIV",
      "imgPath": "assets/messages/Artboard 5.png",
    },
    {
      "prevention": "MEN",
      "desc":
          "Your Partner's HIV status is not yours. Stop the excuses, Go for HIV testing",
      "imgPath": "assets/messages/Artboard 14.png",
    },
    {
      "prevention": "ADOLESCENTS",
      "desc":
          "Stay safe: abstain from sex until you are ready for its consequences.",
      "imgPath": "assets/messages/Artboard 22.png",
    },
    {
      "prevention": "LEADERS",
      "desc":
          "Motivate young people to stay in school and engage in productive activities",
      "imgPath": "assets/messages/Artboard 2.png",
    },
    {
      "prevention": "COMMUNITY",
      "desc": "Testing is the only way to know your HIV status",
      "imgPath": "assets/messages/Artboard 29.png",
    },
    {
      "prevention": "LEADERS",
      "desc":
          "Leaders at all levels should provide clear and accurate information on how to prevent HIV",
      "imgPath": "assets/messages/Artboard 1.png",
    },
    {
      "prevention": "PARENTS",
      "desc":
          "Spend quality time with your children and set an example for them to follow",
      "imgPath": "assets/messages/Artboard 6.png",
    },
    {
      "prevention": "PARENTS",
      "desc":
          "Understand and discuss the unique needs of young people especially adolescents.",
      "imgPath": "assets/messages/Artboard 7.png",
    },
    {
      "prevention": "LEADERS",
      "desc":
          "Mobilize communities to fight negative social cultural practices such as child marriages, gbv, alcohol.",
      "imgPath": "assets/messages/Artboard 4.png",
    },
    {
      "prevention": "PARENTS",
      "desc": "Support your children to complete school",
      "imgPath": "assets/messages/Artboard 9.png",
    },
    {
      "prevention": "PARENTS",
      "desc": "Be faithful to your partner and keep HIV away",
      "imgPath": "assets/messages/Artboard 10.png",
    },
    {
      "prevention": "MEN",
      "desc":
          "Remember as a man, you can only achieve your dreams if you Healthy. Stay safe from HIV",
      "imgPath": "assets/messages/Artboard 11.png",
    },
    {
      "prevention": "MEN",
      "desc":
          "Men you are the champions; Take a lead to end cross generation sex in our communities",
      "imgPath": "assets/messages/Artboard 12.png",
    },
    {
      "prevention": "MEN",
      "desc": "Men take charge; Test for HIV and know your HIV status",
      "imgPath": "assets/messages/Artboard 13.png",
    },
    {
      "prevention": "MEN",
      "desc":
          "Your HIV -ve status expires everytime you have unprotected sex with someone whose HIV status you do not know",
      "imgPath": "assets/messages/Artboard 15.png",
    },
    {
      "prevention": "LIVING WITH HIV",
      "desc": "The day you test HIV positive, begin taking your ARVS",
      "imgPath": "assets/messages/Artboard 16.png",
    },
    {
      "prevention": "LIVING WITH HIV",
      "desc": "Take your ARVs daily as adivsed by the health worker",
      "imgPath": "assets/messages/Artboard 17.png",
    },
    {
      "prevention": "LIVING WITH HIV",
      "desc":
          "ARVs prolong life and enable one to be a productive member of society",
      "imgPath": "assets/messages/Artboard 18.png",
    },
    {
      "prevention": "LIVING WITH HIV",
      "desc":
          "Do you know your viral load? Testing for viral load helps you know if your ARVs are working well.",
      "imgPath": "assets/messages/Artboard 19.png",
    },
    {
      "prevention": "LIVING WITH HIV",
      "desc": "Treatment is free and available in Uganda",
      "imgPath": "assets/messages/Artboard 20.png",
    },
    {
      "prevention": "ADOLESCENTS",
      "desc":
          "Avoid alcohol/drug abuse in order to avoid getting HIV. Alcohol/drugs impair your judgement.",
      "imgPath": "assets/messages/Artboard 21.png",
    },
    {
      "prevention": "ADOLESCENTS",
      "desc": "Concentrate on your studies and your future",
      "imgPath": "assets/messages/Artboard 23.png",
    },
    {
      "prevention": "ADOLESCENTS",
      "desc": "Take an HIV test and know your status",
      "imgPath": "assets/messages/Artboard 24.png",
    },
    {
      "prevention": "ADOLESCENTS",
      "desc": "Even 'healthy-looking' people could have HIV",
      "imgPath": "assets/messages/Artboard 25.png",
    },
    {
      "prevention": "COMMUNITY",
      "desc":
          "Avoid alcohol/drug abuse in order to avoid getting HIV. Alcohol/drugs impair your judgement.",
      "imgPath": "assets/messages/Artboard 26.png",
    },
    {
      "prevention": "COMMUNITY",
      "desc":
          "Is it our responsibility to support People living with HIV to adhere to treatment",
      "imgPath": "assets/messages/Artboard 27.png",
    },
    {
      "prevention": "COMMUNITY",
      "desc":
          "Your Partner's HIV status is not yours. Stop the excuses, Go for HIV testing.",
      "imgPath": "assets/messages/Artboard 28.png",
    },
    {
      "prevention": "COMMUNITY",
      "desc":
          "HIV testing is beneficial, it allows you to seek treatment if you are HIV positive.",
      "imgPath": "assets/messages/Artboard 30.png",
    }
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
        itemCount: messages.length,
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
                        image: AssetImage(messages[index]["imgPath"]!),
                        height: constraint.maxHeight * 0.46,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight * 0.1,
                        child: AutoSizeText(
                          "${messages[index]["prevention"]}",
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
                          "${messages[index]['desc']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            color: Colors.black26,
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
