import '/exports/exports.dart';

import '/screens/myths_page.dart';
import '/screens/precautions_page.dart';
// import '/screens/messages/messages_page.dart';
import '/screens/symptoms_page.dart';
import '/screens/updates_page.dart';
import '/screens/virus_details_page.dart';
import '/screens/video.dart';

// ignore: must_be_immutable
class CategoryTab extends StatelessWidget {
  final imgPath, tabName, imgHeight, imgLeft, imgBottom;
  final Color color;
  final String tabDesc;
  final AutoSizeGroup titleGrp, descGrp;

  const CategoryTab({
    required this.imgPath,
    required this.tabName,
    required this.color,
    required this.tabDesc,
    this.imgHeight = 100.0,
    this.imgLeft = 15.0,
    this.imgBottom = -8.0,
    required this.titleGrp,
    required this.descGrp,
  });

  VoidCallback getPage(tabName, context) {
    switch (tabName) {
      case ("Symptoms"):
        return () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                SymptomsScreen(color: color, imgPath: imgPath),
          ),
        );
      case ("HIV Prevention"):
        return () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                PrecautionsScreen(color: color, imgPath: imgPath),
          ),
        );
      // case ("HIV Messages"):
      //   return () => Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) =>
      //           MessagesScreen(color: color, imgPath: imgPath)));
      case ("Myths & Misconceptions"):
        return () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MythsScreen(color: color, imgPath: imgPath),
          ),
        );
      case ("About HIV"):
        return () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                VirusDetailsScreen(color: color, imgPath: imgPath),
          ),
        );
      case ("News/Events"):
        return () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UpdatesScreen(color: color, imgPath: imgPath),
          ),
        );
      case ("Video Updates"):
        return () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => Video()));
      case ("HIV Messages"):
        return () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => MessagesScreen()));
    }
    return () {};
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: getPage(tabName, context),
          child: Container(
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: color.withAlpha(40)),
              color: color.withValues(alpha: 0.13),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: imgPath,
                  child: Container(
                    width: constraints.maxWidth * 0.2,
                    height: constraints.maxWidth * 0.2,
                    padding: EdgeInsets.fromLTRB(3, 10, 0, 10),
                    margin: EdgeInsets.fromLTRB(3, 10, 0, 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imgPath),
                        fit: BoxFit.contain,
                      ),
                    ),
                    // child: Image.asset(
                    //   imgPath,
                    //   // fit: BoxFit.cover,
                    // ),
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
                            fontSize: constraints.maxWidth * 0.051,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: tabDesc,
                          style: TextStyle(
                            color: color,
                            fontSize: constraints.maxWidth * 0.03,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    stepGranularity: 1,
                    minFontSize: 10,
                    maxFontSize: 19,
                    maxLines: 3,
                    group: titleGrp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
