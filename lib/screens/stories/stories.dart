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
        child: Column(
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
        ),
      ),
    );
  }
}
