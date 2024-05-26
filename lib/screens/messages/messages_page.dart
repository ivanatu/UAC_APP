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
      backgroundColor: Colors.grey[100],
      body: BottomTopMoveAnimationView(
        child: Stack(
          children: [
            //Background Image
            Positioned.fill(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/imgs/hiv.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 40, sigmaY: 50),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black12,
                    ),
                  )),
            ),
            //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 8, 5),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "\n Messages",
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
