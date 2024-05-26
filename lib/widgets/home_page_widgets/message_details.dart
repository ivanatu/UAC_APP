// import 'package:aids_awareness_app/models/message_model.dart';

import '/models/messages_model.dart';

import '/exports/exports.dart';

class MessageDetails extends StatefulWidget {
  final Datum message;
  const MessageDetails({super.key, required this.message});

  @override
  State<MessageDetails> createState() => _MessageDetailsState();
}

class _MessageDetailsState extends State<MessageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.message.attributes.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                // color: Colors.white,
              ),
        ),
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: List.generate(
                    widget.message.attributes.content.length, (i) {
              return Text(
                widget.message.attributes.content[i].children.single.text,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: "Montserrat",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              );
            })),
          ),
        ]),
      ),
    );
  }
}
