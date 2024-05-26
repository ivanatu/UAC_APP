// import 'package:aids_awareness_app/models/message_model.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

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
        actions: [
          Hero(
            tag: Apis.url + widget.message.attributes.image.data.attributes.url,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    Apis.url +
                        widget.message.attributes.image.data.attributes.url,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Markdown(
          data: widget.message.attributes.content,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            p: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16,
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }
}
