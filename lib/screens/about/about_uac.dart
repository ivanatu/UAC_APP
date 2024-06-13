import '/exports/exports.dart';

class AboutUac extends StatefulWidget {
  const AboutUac({super.key});

  @override
  State<AboutUac> createState() => _AboutUacState();
}

class _AboutUacState extends State<AboutUac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About UAC"),
        titleTextStyle: Theme.of(context).textTheme.titleMedium!.apply(
              fontFamily: 'Montserrat',
              fontWeightDelta: 2,
            ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: "side_image",
                      child: Image.asset(
                        "lib/images/img.png",
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "UAC | All rights reserved | version 1.0.0",
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      fontFamily: 'Montserrat',
                      fontWeightDelta: 1,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
