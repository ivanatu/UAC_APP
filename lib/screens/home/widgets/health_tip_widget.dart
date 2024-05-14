import "/exports/exports.dart";

class HealthTipWidget extends StatelessWidget {
  const HealthTipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.51),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "\nHealth Tip of the Day",
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                              fontWeightDelta: 10,
                            ),
                      ),
                      TextSpan(
                        text:
                            "\nEat a variety of foods. For good health, we need more than 40 different nutrients, and no single food can supply them all. It is not about a single meal, it is about a balanced food choice over time that will make a difference!",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: SvgPicture.asset(
            "assets/svgs/health_tip.svg",
            width: 150,
            height: 150,
          ),
        ),
      ],
    );
  }
}
