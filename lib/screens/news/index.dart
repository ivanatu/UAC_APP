import "/exports/exports.dart";

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "\n  News",
              style: Theme.of(context).textTheme.headlineLarge!.apply(
                    fontWeightDelta: 10,
                  ),
            ),
          ],
        ),
      ),
    ]);
  }
}
