import '/exports/exports.dart';

import '../../screens/myths_page.dart';
import '../../screens/precautions_page.dart';
import '../../screens/messages/messages_page.dart';
import '../../screens/symptoms_page.dart';
import '../../screens/updates_page.dart';
import '../../screens/virus_details_page.dart';
import '../../screens/stats/stats_dashboard_screens/world_stat.dart';
import '../../screens/video.dart';

// ignore: must_be_immutable
class CategoryTab extends StatelessWidget {
  final imgPath, tabName, imgHeight, imgLeft, imgBottom;
  final Color color;
  final String tabDesc;
  final AutoSizeGroup titleGrp, descGrp;

  const CategoryTab(
      {required this.imgPath,
      required this.tabName,
      required this.color,
      required this.tabDesc,
      this.imgHeight = 100.0,
      this.imgLeft = 15.0,
      this.imgBottom = -8.0,
      required this.titleGrp,
      required this.descGrp});

  VoidCallback getPage(tabName, context) {
    switch (tabName) {
      case ("Symptoms"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                SymptomsScreen(color: color, imgPath: imgPath)));
      case ("Precautions"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                PrecautionsScreen(color: color, imgPath: imgPath)));
      // case ("HIV Messages"):
      //   return () => Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) =>
      //           MessagesScreen(color: color, imgPath: imgPath)));
      case ("Myths"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MythsScreen(color: color, imgPath: imgPath)));
      case ("Virus"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                VirusDetailsScreen(color: color, imgPath: imgPath)));
      case ("Updates"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UpdatesScreen(
                  color: color,
                  imgPath: imgPath,
                )));
      case ("Statistics"):
        return () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WorldStatScreen()));

      case ("Video Updates"):
        return () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Video()));
    }
    return () {};
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getPage(tabName, context),
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: color.withAlpha(40),
          ),
          color: color.withOpacity(0.13),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: imgHeight * 0.5,
              height: imgHeight * 0.5,
              margin: EdgeInsets.fromLTRB(15, 20, 5, 10),
              child: Hero(
                tag: imgPath,
                child: Image.asset(
                  imgPath,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            Space(),
            Center(
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "$tabName\n",
                      style: TextStyle(
                        color: color,
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: tabDesc,
                      style: TextStyle(
                        color: color,
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                stepGranularity: 1,
                maxFontSize: 23,
                maxLines: 3,
                group: titleGrp,
              ),
            ),
            // AutoSizeText(
            //   "$tabDesc",
            //   style: TextStyle(
            //     color: color,
            //     fontFamily: "Montserrat",
            //     fontSize: 15,
            //     fontWeight: FontWeight.w500,
            //   ),
            //   stepGranularity: 1,
            //   maxFontSize: 19,
            //   maxLines: 3,
            //   group: descGrp,
            // ),
          ],
        ),
      ),
    );
  }
}
