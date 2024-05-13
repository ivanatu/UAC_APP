import 'package:auto_size_text/auto_size_text.dart';

import '../../widgets/home_page_widgets/message_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessagesScreen extends StatefulWidget {
  final imgPath;
  final Color color;

  MessagesScreen({this.imgPath, required this.color});

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: widget.color,
              size: 28,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          //image container
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
            ),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  color: widget.color.withOpacity(0.2)),
              width: MediaQuery.of(context).size.width,
              child: LayoutBuilder(
                builder: (ctx, constraint) => Stack(
                  children: <Widget>[
                    //Name
                    Positioned(
                      top: constraint.maxHeight * 0.4,
                      left: 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: constraint.maxWidth * 0.55,
                          child: AutoSizeText(
                            "Messages",
                            style: TextStyle(
                              color: widget.color,
                              fontFamily: "Montserrat",
                              fontSize: 31,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            maxFontSize: 31,
                            stepGranularity: 1,
                          ),
                        ),
                      ),
                    ),

                    //Image
                    Positioned.fill(
                      bottom: -15.0,
                      right: -1.0,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                            tag: widget.imgPath,
                            child: Image(
                              image: AssetImage(widget.imgPath),
                              height: constraint.maxHeight * 0.93,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
