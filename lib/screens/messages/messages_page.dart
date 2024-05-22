import '../../widgets/home_page_widgets/message_card.dart';
import '/exports/exports.dart';

// ignore: must_be_immutable
class MessagesScreen extends StatefulWidget {
  MessagesScreen({super.key});

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 5),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "\n Messages",
                    style: Theme.of(context).textTheme.headlineLarge!.apply(
                          fontWeightDelta: 10,
                        ),
                  ),
                ],
              ),
            ),
          ),

          //Precaution Card Grid
          Flexible(
            fit: FlexFit.loose,
            child: MessageCard(),
          )
        ],
      ),
    );
  }
}
