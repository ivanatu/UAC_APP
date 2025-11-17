import "/exports/exports.dart";
import '/widgets/home_page_widgets/home_category.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();
  static List<Map<String, dynamic>> categoryData = [
    {
      "imgBottom": 10.0,
      "imgLeft": 3.0,
      "tabName": "About HIV",
      "imgHeight": 130.0,
      "tabDesc": "Know more about the virus",
      "imgPath": "assets/corona.png",
      "color": Colors.orange[700],
    },
    {
      "imgPath": "assets/imgs/hiv.png",
      "imgHeight": 140.0,
      "imgLeft": 15.0,
      "imgBottom": 0.0,
      "tabName": "HIV Prevention",
      "tabDesc": "How to prevent HIV",
      "color": Colors.lightBlue[700],
    },
    {
      "imgPath": "assets/imgs/myths.png",
      "tabName": "Myths & Misconceptions",
      "imgBottom": -30.0,
      "imgLeft": 20.0,
      "imgHeight": 170.0,
      "tabDesc": "Get rid of myths and misconceptions\n about HIV /AIDS",
      "color": Colors.redAccent[700],
    },
    {
      "imgPath": "assets/imgs/hiv_msgs.png",
      "tabName": "HIV Messages",
      "imgBottom": -30.0,
      "imgLeft": 20.0,
      "imgHeight": 170.0,
      "tabDesc": "Messages for the community",
      "color": Colors.tealAccent[700],
    },
    {
      "imgBottom": -4.0,
      "imgLeft": 8.0,
      "imgPath": "assets/updates/updates.png",
      "tabName": "Updates",
      "imgHeight": 146.0,
      "tabDesc": "View the latest news related to\n the virus",
      "color": Colors.greenAccent[700],
    },
    {
      "imgBottom": 7.0,
      "imgLeft": 0.0,
      "imgPath": "assets/updates/play-button.png",
      "tabName": "Video Updates",
      "imgHeight": 110.0,
      "tabDesc": "Watch informative videos\n about HIV/AIDS",
      "color": Colors.teal[800],
    },
  ];

  @override
  Widget build(BuildContext context) {
    String greet() {
      // Get the current hour
      DateTime now = DateTime.now();
      int currentHour = now.hour;

      // Determine the greeting based on the hour
      String greeting;
      if (currentHour >= 5 && currentHour < 12) {
        greeting = 'Good morning!';
      } else if (currentHour >= 12 && currentHour < 17) {
        greeting = 'Good afternoon!';
      } else {
        greeting = 'Good evening!';
      }
      return greeting;
    }

    return Scaffold(
      body: BottomTopMoveAnimationView(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Provider.of<ZDrawerController>(
                        context,
                        listen: false,
                      ).toggleDrawerSelected();
                    },
                    child: SvgPicture.asset(
                      "assets/svgs/drawer.svg",
                      // color: Theme.of(context).primaryColor,
                      width: 30,
                    ),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      greet(),
                      textStyle: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.apply(fontWeightDelta: 1),
                      speed: const Duration(milliseconds: 300),
                    ),
                    TypewriterAnimatedText(
                      "Welcome to UAC",
                      textStyle: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.apply(fontWeightDelta: 4),
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 400),
                  // displayFullTextOnTap: true,
                  // stopPauseOnTap: true,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: "lib/images/img.png",
                    child: Image.asset(
                      "lib/images/img.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
            Space(space: 0.057),

            // health tip of the day
            // HealthTipWidget(),
            //
            ...List.generate(categoryData.length, (index) {
              var cat = categoryData[index];
              return CategoryTab(
                titleGrp: titleGrp,
                descGrp: descGrp,
                imgPath: cat["imgPath"],
                imgBottom: cat["imgBottom"],
                imgHeight: cat["imgHeight"],
                imgLeft: cat["imgLeft"],
                tabDesc: cat["tabDesc"],
                tabName: cat["tabName"],
                color: cat["color"],
              );
            }),
          ],
        ),
      ),
    );
  }
}
