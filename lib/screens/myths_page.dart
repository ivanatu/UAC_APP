import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import '/exports/exports.dart';

class MythsScreen extends StatefulWidget {
  final imgPath;
  final Color color;

  const MythsScreen({Key? key, this.imgPath, required this.color})
    : super(key: key);

  @override
  State<MythsScreen> createState() => _MythsScreenState();
}

class _MythsScreenState extends State<MythsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MythController>(context, listen: false).getMythList();
  }

  Widget noData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.info_outline,
            size: 100,
            color: Colors.grey.shade400,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "No Myths available",
          style: Theme.of(context).textTheme.titleLarge!.apply(
            fontWeightDelta: 2,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).primaryColor,
        ),
        strokeWidth: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                          "Myths & Misconceptions",
                          style: TextStyle(
                            color: widget.color,
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
                  //Image
                  Positioned.fill(
                    bottom: -17.0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                            tag: widget.imgPath,
                            child: Image(
                              image: AssetImage(widget.imgPath),
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
          SizedBox(height: 10),
          //Accordion Section
          Expanded(
            child: Consumer<MythController>(
              builder: (context, mythController, child) {
                if (mythController.isLoading) {
                  return loading();
                } else if (mythController.mythList.isEmpty) {
                  return noData();
                } else {
                  return Accordion(
                    headerBorderColor: widget.color,
                    headerBackgroundColor: widget.color,
                    headerBorderColorOpened: Colors.transparent,
                    headerBackgroundColorOpened: widget.color,
                    contentBackgroundColor: Colors.white,
                    contentBorderColor: widget.color,
                    contentBorderWidth: 1,
                    contentHorizontalPadding: 20,
                    scaleWhenAnimating: true,
                    openAndCloseAnimation: true,
                    headerPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                    sectionClosingHapticFeedback: SectionHapticFeedback.light,
                    children: List.generate(mythController.mythList.length, (
                      index,
                    ) {
                      var data = mythController.mythList[index];
                      return AccordionSection(
                        isOpen: index == 0 ? true : false,
                        contentVerticalPadding: 15,
                        header: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(
                            data.attributes.myth,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .apply(color: Colors.white, fontWeightDelta: 6),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 12,
                            maxFontSize: 20,
                            stepGranularity: 1,
                          ),
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Text(
                              "Facts",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .apply(
                                    fontWeightDelta: 8,
                                    color: widget.color,
                                  ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              data.attributes.facts,
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                }
              },
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
