import "/exports/exports.dart";

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                    text: "\n  Chat",
                    style: Theme.of(context).textTheme.headlineLarge!.apply(
                          fontWeightDelta: 10,
                        ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Chat Not available",
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      fontWeightDelta: 2,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
