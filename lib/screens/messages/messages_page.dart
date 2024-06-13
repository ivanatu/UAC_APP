import 'dart:ui';

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
      backgroundColor: Colors.grey.shade50,
      body: BottomTopMoveAnimationView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 5),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: " Messages",
                          style:
                              Theme.of(context).textTheme.headlineLarge!.apply(
                                    fontWeightDelta: 10,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Precaution Card Grid
                Flexible(
                  child: MessageCard(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
