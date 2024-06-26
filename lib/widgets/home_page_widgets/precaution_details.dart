import '/exports/exports.dart';

class PrecautionDetails extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  const PrecautionDetails(
      {super.key,
      required this.description,
      required this.image,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontFamily: 'Montserrat',
                fontWeightDelta: 3,
              ),
        ),
      ),
      body: BottomTopMoveAnimationView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Image.network(
                    image,
                    height: constraints.maxHeight * 0.64,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
