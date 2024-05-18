import "package:auto_size_text/auto_size_text.dart";

import "/exports/exports.dart";

class HealthTipWidget extends StatelessWidget {
  const HealthTipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.31),
          width: 0.4,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AutoSizeText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Health Tip of the Day",
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                          fontWeightDelta: 4,
                        ),
                  ),
                  TextSpan(
                    text:
                        "\nFor good health, we need more than 40 different nutrients, and no single food can supply them all. It is not about a single meal!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
