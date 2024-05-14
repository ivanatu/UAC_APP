import '../../widgets/home_page_widgets/home_categories.dart';
import "/exports/exports.dart";
import "./widgets/health_tip_widget.dart";
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.01),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "\n  Good morning",
                  style: Theme.of(context).textTheme.headlineMedium!.apply(
                        fontWeightDelta: 10,
                      ),
                ),
              ],
            ),
          ),
          // health tip of the day
          HealthTipWidget(),
        ],
      ),
    );
  }
}
