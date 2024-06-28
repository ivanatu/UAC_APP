import "package:flutter/gestures.dart";
import "package:url_launcher/url_launcher.dart";

import "/exports/exports.dart";

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "\n  Get in Touch",
                  style: Theme.of(context).textTheme.headlineLarge!.apply(
                        fontWeightDelta: 3,
                        fontFamily: "Montserrat",
                      ),
                ),
              ],
            ),
          ),
          // card for holding uac information
          Card(
            color: Colors.grey.shade100,
            margin: EdgeInsets.all(10),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.grey.shade400,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Website:  ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            )),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrl(
                                Uri.parse("https://www.uac.go.ug/"),
                              );
                            },
                          text: "https://www.uac.go.ug/",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        // email
                        TextSpan(
                          text: "\nEmail:  ",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        TextSpan(
                          text: "uac@uac.go.ug",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        // phone
                        TextSpan(
                            text: "\nPhone:  ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            )),
                        TextSpan(
                          text: "+256 414 288065", //+ 256 414 288065
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        // address
                        TextSpan(
                          text: "\nAddress:  ",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        TextSpan(
                          text:
                              "Plot 1-3 Salim Bay Rd, Ntinda, Kampala, Uganda",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        // open
                        TextSpan(text: "\nOpen\n  "),
                        TextSpan(
                          text: "From Mon -  Fri 9:00 am - 5:00 pm",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          fontWeightDelta: 2,
                        ),
                  ),
                ),
                //  design a card for sending feedback
              ],
            ),
          ),
          Card(
            color: Colors.grey.shade100,
            margin: EdgeInsets.all(10),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.grey.shade400,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Send Feedback",
                          style:
                              Theme.of(context).textTheme.headlineMedium!.apply(
                                    fontFamily: 'Montserrat',
                                    fontWeightDelta: 2,
                                  ),
                        ),
                        TextSpan(
                            text:
                                "\nWe would love to hear from you. Please send us your feedback, suggestions, or any issues you may have encountered while using our app.",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                  fontFamily: 'Montserrat',
                                )),
                        TextSpan(
                          text: "\n\n  Click here to send feedback.",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrl(
                                Uri.parse(
                                    "mailto:uac@uac.go.ug?subject=Feedback"),
                              );
                            },
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Montserrat',
                                fontWeightDelta: 4,
                              ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Space(),
          // or
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    "OR",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            //
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 0, 1.0),
            child: Text(
              "Chat with on:\n",
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    fontFamily: "Montserrat",
                    fontWeightDelta: 3,
                  ),
            ),
          ),
          // social media
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/svgs/facebook.svg",
                  color: Colors.blue.shade900,
                  width: 40,
                  height: 40,
                ),
                onPressed: () {
                  launchUrl(
                    Uri.parse("https://www.facebook.com/UgandaAidsCommission"),
                  );
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/svgs/whatsapp.svg",
                  color: Colors.green,
                  width: 40,
                  height: 40,
                ),
                onPressed: () {
                  launchUrl(
                    Uri.parse("https://wa.me/"),
                  );
                },
              ),
              // twitter
              IconButton(
                icon: SvgPicture.asset(
                  "assets/svgs/twitter.svg",
                  width: 40,
                  height: 40,
                ),
                onPressed: () {
                  launchUrl(
                    Uri.parse(
                        "https://x.com/aidscommission?ref_src=twsrc%5Etfw%7Ctwcamp%5Eembeddedtimeline%7Ctwterm%5Escreen-name%3Aaidscommission%7Ctwcon%5Es2"),
                  );
                },
              ),
              // phone
              IconButton(
                icon: Icon(
                  Icons.phone,
                  color: Colors.teal.shade600,
                  size: 40,
                ),
                onPressed: () {
                  launchUrl(
                    Uri.parse("tel:+256414288065"),
                  );
                },
              ),
              // share
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.orange.shade600,
                  size: 40,
                ),
                onPressed: () {
                  Share.share("https://www.uac.go.ug/",
                      subject:
                          "Hey, I found this amazing app that helps me stay updated with the latest news and stats on HIV/AIDS. You should check it out too. https://www.uac.go.ug/",
                      sharePositionOrigin: Rect.fromPoints(
                        Offset(5, -5),
                        Offset(-5, 5),
                      ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
