import 'package:uac/controllers/virus_details_controller.dart';
import 'package:uac/exports/exports.dart';

// ignore: must_be_immutable
class VirusDetailsScreen extends StatefulWidget {
  final imgPath;
  final Color color;
  const VirusDetailsScreen({Key? key, this.imgPath, required this.color})
    : super(key: key);

  @override
  State<VirusDetailsScreen> createState() => _VirusDetailsScreenState();
}

class _VirusDetailsScreenState extends State<VirusDetailsScreen> {
  // static List<Map<String, String>> details = [
  //   {
  //     "detail": "Introduction",
  //     "desc":
  //         "Human Immunodeficiency Virus (HIV) is an infection that attacks the body’s immune system. Acquired Immunodeficiency Syndrome (AIDS) is the most advanced stage of the disease. HIV targets the body’s white blood cells, weakening the immune system. This makes it easier to get sick with diseases like tuberculosis, infections and some cancers",
  //   },
  //   {
  //     "detail": "Origin",
  //     "desc":
  //         "The origin of HIV is believed to be a type of chimpanzee in Central Africa that carried the virus and was hunted for meat1. HIV is transmitted through contact with certain body fluids from a person with HIV, such as blood, semen, vaginal fluids, rectal fluids, and breast milk"
  //   },
  //   {
  //     "detail": "How dangerous is it?",
  //     "desc":
  //         "HIV is very dangerous because it weakens the immune system and makes it difficult for the body to fight off infections and diseases. If left untreated, HIV can lead to AIDS which can be fatal.",
  //   },
  //   // {
  //   //   "detail": "Its Symptoms",
  //   //   "desc":
  //   //       "HIV symptoms can vary from person to person. Some people may experience flu-like symptoms within the first few weeks after contracting the virus. These symptoms may include fever, headache, muscle aches, and fatigue",
  //   // },
  //   {
  //     "detail": "Are there any vaccines for the virus?",
  //     "desc":
  //         "There is no cure for HIV, but there are treatments that can help people with HIV live longer and healthier lives. Antiretroviral therapy (ART) is the recommended treatment for HIV2. By reducing the amount of HIV in the body, HIV medicines also reduce the risk of HIV transmission. A main goal of HIV treatment is to reduce a person’s viral load to an undetectable level. An undetectable viral load means that the level of HIV in the blood is too low to be detected by a viral load test.",
  //   },
  // ];

  // static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VirusDetailsController>(
        context,
        listen: false,
      ).getVirusDetailsInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: widget.color, size: 28),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: pageHeight,
        child: Column(
          children: <Widget>[
            //image tag container
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
                color: widget.color.withValues(alpha: 0.2),
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
                            "HIV/AIDS",
                            style: TextStyle(
                              color: widget.color,
                              fontFamily: "Montserrat",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                            stepGranularity: 2,
                            maxFontSize: 30,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),

                    //Image
                    Positioned.fill(
                      right: -90,
                      bottom: -30,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                            tag: widget.imgPath,
                            child: Image(
                              image: AssetImage(widget.imgPath),
                              height: constraint.maxHeight * 0.92,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Details List
          ],
        ),
      ),
    );
  }
}
