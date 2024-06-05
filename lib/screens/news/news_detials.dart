import 'package:flutter_markdown/flutter_markdown.dart';

import '/models/newz_model.dart';

import '/exports/exports.dart';

class NewsDetails extends StatefulWidget {
  final Datum newz;
  const NewsDetails({super.key, required this.newz});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black12,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.newz.attributes.image.data.attributes.url,
                  child: Container(
                    height: constraints.maxWidth * 0.842,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          Apis.url +
                              widget.newz.attributes.image.data.attributes.url,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: constraints.maxWidth,
                    height: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black54,
                          Colors.black12,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: constraints.maxWidth,
                    height: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black54,
                          Colors.black12,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: AppBar(
                    // forceMaterialTransparency: true,
                    backgroundColor: Colors.transparent,
                    leading: BackButton(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: constraints.maxWidth * 0.55,
                  left: 10,
                  child: AutoSizeText(
                    widget.newz.attributes.title.substring(
                          0,
                          (widget.newz.attributes.title.length ~/ 2),
                        ) +
                        "\n" +
                        widget.newz.attributes.title.substring(
                          (widget.newz.attributes.title.length ~/ 2),
                          (widget.newz.attributes.title.length),
                        ),
                    maxLines: 2,
                    maxFontSize: 22,
                    minFontSize: 15,
                    style: Theme.of(context).textTheme.headlineSmall!.apply(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeightDelta: 10,
                        ),
                  ),
                )
              ],
            ),
            Flexible(
              child: Hero(
                tag: widget.newz.attributes.title,
                child: Markdown(
                  data: widget.newz.attributes.content,
                  styleSheet: MarkdownStyleSheet(
                    p: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
