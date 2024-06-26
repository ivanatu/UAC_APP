import 'package:aids_awareness_app/screens/stories/stories_details.dart';

import '/exports/exports.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: "stories", child: Text("Stories")),
      ),
      body: SafeArea(
        child: Consumer<StoriesController>(builder: (context, controller, x) {
          controller.getStories();
          return controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                  ),
                )
              : controller.stories.isEmpty
                  ? Column(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            "assets/svgs/no_faq.svg",
                            height: 300,
                            width: 300,
                          ),
                        ),
                        Text(
                          "No Stories available",
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                // color: Colors.grey.shade500,
                                fontFamily: 'Monospace',
                              ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: controller.stories.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Routes.animateToPage(
                              StoriesDetails(
                                title:
                                    controller.stories[index].attributes.title,
                                description: controller
                                    .stories[index].attributes.description,
                                image: Apis.url +
                                    controller.stories[index].attributes.image
                                        .data.attributes.url,
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Hero(
                                  tag: Apis.url +
                                      controller.stories[index].attributes.image
                                          .data.attributes.url,
                                  child: Image.network(Apis.url +
                                      controller.stories[index].attributes.image
                                          .data.attributes.url),
                                ),
                                Hero(
                                  tag: controller
                                      .stories[index].attributes.title,
                                  child: Text(
                                    controller.stories[index].attributes.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(fontFamily: 'Mo'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
        }),
      ),
    );
  }
}
