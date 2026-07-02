import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VirusDetailsController>(
        context,
        listen: false,
      ).getVirusDetailsInfo(forceRefresh: true);
    });
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
      body: SafeArea(
        top: false,
        child: RefreshIndicator.adaptive(
          onRefresh: () => Provider.of<VirusDetailsController>(
            context,
            listen: false,
          ).getVirusDetailsInfo(forceRefresh: true),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
                Consumer<VirusDetailsController>(
                  builder: (context, controller, child) {
                    var virusDetailsModel = controller.virusDetailsModel;
                    if (controller.isLoading || virusDetailsModel == null) {
                      return Center(
                        child: CircularProgressIndicator(color: widget.color),
                      );
                    }

                    return Markdown(
                      data: controller
                          .virusDetailsModel!
                          .data
                          .attributes
                          .description,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      styleSheet:
                          MarkdownStyleSheet.fromTheme(
                            Theme.of(context),
                          ).copyWith(
                            p: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,

                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
