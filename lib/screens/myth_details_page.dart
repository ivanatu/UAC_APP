import '/exports/exports.dart';

class MythDetailsPage extends StatefulWidget {
  final String tag;
  final String myth;
  final String title;
  final String img;
  const MythDetailsPage(
      {super.key,
      required this.tag,
      required this.myth,
      required this.img,
      required this.title});

  @override
  State<MythDetailsPage> createState() => _MythDetailsPageState();
}

class _MythDetailsPageState extends State<MythDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Myth Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        // backgroundColor: Colors.transparent,
      ),
      body: BottomTopMoveAnimationView(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            Hero(
              tag: widget.tag,
              child: Image.asset(
                widget.img,
                height: 300,
                width: double.infinity,
                // fit: BoxFit.cover,
              ),
            ),
            Text(
              "\nMyth",
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    fontWeightDelta: 2,
                  ),
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: AutoSizeText(
                  widget.title,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.1,
                    fontFamily: "Montserrat",
                  ),
                  maxFontSize: 20,
                  stepGranularity: 2,
                  maxLines: 2,
                ),
              ),
            ),
            Text(
              "\nFacts",
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    fontWeightDelta: 2,
                  ),
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  widget.myth,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.5,
                    height: 1.4,
                    fontFamily: "Montserrat",
                    // color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                  maxFontSize: 16.5,
                  stepGranularity: 1.5,
                  maxLines: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
