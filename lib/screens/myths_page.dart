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
                    headerBorderColor: Colors.blueGrey,
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
                        isOpen: false,
                        contentVerticalPadding: 15,
                        header: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                Apis.url +
                                    data.attributes.image.data.attributes.url,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.grey.shade300,
                                    child: Icon(Icons.image_not_supported),
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                data.attributes.myth,
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .apply(
                                      color: Colors.white,
                                      fontWeightDelta: 2,
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                Apis.url +
                                    data.attributes.image.data.attributes.url,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: double.infinity,
                                    height: 200,
                                    color: Colors.grey.shade300,
                                    child: Center(
                                      child: Icon(
                                        Icons.image_not_supported,
                                        size: 50,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Myth",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .apply(
                                    fontWeightDelta: 3,
                                    color: widget.color,
                                  ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Text(
                                data.attributes.myth,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.4,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Facts",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .apply(
                                    fontWeightDelta: 3,
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
