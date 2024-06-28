// import '../../widgets/home_page_widgets/home_categories.dart';
import "../../controllers/drawer_controller.dart";
import "/exports/exports.dart";
import "./widgets/health_tip_widget.dart";
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
      "tabDesc": "How to prevent being a victim",
      "color": Colors.lightBlue[700],
    },
    {
      "imgPath": "assets/imgs/myths.png",
      "tabName": "Myths/FAQs",
      "imgBottom": -30.0,
      "imgLeft": 20.0,
      "imgHeight": 170.0,
      "tabDesc": "Get rid of false assumptions",
      "color": Colors.redAccent[700],
    },
    // {
    //   "imgPath": "assets/messages/android-message-icon-8.png",
    //   "imgHeight": 120.0,
    //   "imgLeft": 15.0,
    //   "imgBottom": 2.0,
    //   "tabName": "HIV Messages",
    //   "tabDesc": "Messages for the community",
    //   "color": Colors.lightGreen[700],
    // },
    // {
    //   "imgLeft": 5.0,
    //   "imgBottom": 19.0,
    //   "imgHeight": 122.0,
    //   "imgPath": "assets/stats.png",
    //   "tabName": "Statistics",
    //   "tabDesc": "See how it is affecting the world",
    //   "color": Colors.deepPurpleAccent,
    // },
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

    //
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.light,
    // ));
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
                      Provider.of<ZDrawerController>(context, listen: false)
                          .toggleDrawerSelected();
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
                      textStyle: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 1,
                          ),
                      speed: const Duration(milliseconds: 300),
                    ),
                    TypewriterAnimatedText(
                      "Welcome to UAC",
                      textStyle: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontWeightDelta: 4,
                          ),
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 400),
                  // displayFullTextOnTap: true,
                  // stopPauseOnTap: true,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(),
                      // TextSpan(
                      //   text: "\n  Welcome to UAC",
                      //   style: Theme.of(context).textTheme.titleMedium!.apply(
                      //         fontWeightDelta: 2,
                      //       ),
                      // ),
                    ],
                  ),
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
            Space(
              space: 0.057,
            ),
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
            })
          ],
        ),
      ),
    );
  }
}
