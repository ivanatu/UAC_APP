import "/services/news_services.dart";

import "/exports/exports.dart";
import "news_detials.dart";

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: " News",
                      style: Theme.of(context).textTheme.headlineLarge!.apply(
                            fontWeightDelta: 10,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
                future: NewzService().getNews(),
                builder: (context, snapshot) {
                  var newz = snapshot.data ?? [];
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: newz.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetails(
                                    newz: newz[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: constraints.maxWidth,
                              height: constraints.maxWidth * 0.842,
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Hero(
                                    tag: newz[index]
                                        .attributes
                                        .image
                                        .data
                                        .attributes
                                        .url,
                                    child: Container(
                                      width: constraints.maxWidth,
                                      height: constraints.maxWidth * 0.65,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            Apis.url +
                                                newz[index]
                                                    .attributes
                                                    .image
                                                    .data
                                                    .attributes
                                                    .url,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Hero(
                                    tag: newz[index].attributes.title,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: AutoSizeText(
                                        newz[index].attributes.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .apply(
                                              fontWeightDelta: 2,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            strokeCap: StrokeCap.butt,
                            strokeWidth: 10,
                          ),
                          Space(),
                          Text(
                            "Loading newz",
                            style:
                                Theme.of(context).textTheme.titleLarge!.apply(
                                      fontWeightDelta: 2,
                                    ),
                          )
                        ],
                      ),
                    );
                  }
                })
            // Expanded(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       AspectRatio(
            //         aspectRatio: 1.85,
            //         child: SvgPicture.asset(
            //           "assets/svgs/nodata.svg",
            //         ),
            //       ),
            //       Text(
            //         "No news available",
            //         style: Theme.of(context).textTheme.bodyLarge!.apply(
            //               fontWeightDelta: 2,
            //             ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        );
      }),
    );
  }
}
