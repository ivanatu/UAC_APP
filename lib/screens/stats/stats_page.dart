import "/exports/exports.dart";

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
              Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "\n  Stats",
                  style: Theme.of(context).textTheme.headlineLarge!.apply(
                        fontWeightDelta: 10,
                      ),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
