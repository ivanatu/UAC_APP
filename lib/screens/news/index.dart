import "/exports/exports.dart";

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style: Theme.of(context).textTheme.headlineLarge!.apply(
                fontWeightDelta: 10,
              ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text.rich(
          //   TextSpan(
          //     children: [
          //       TextSpan(
          //         text: "\n  News",
          //         style: Theme.of(context).textTheme.headlineLarge!.apply(
          //               fontWeightDelta: 10,
          //             ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1.85,
                  child: SvgPicture.asset(
                    "assets/svgs/nodata.svg",
                  ),
                ),
                Text(
                  "No news available",
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        fontWeightDelta: 2,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
