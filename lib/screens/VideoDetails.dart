import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetails extends StatelessWidget {
  final String title;
  final String description;
  final String vidId;

  const VideoDetails({this.title, this.description, this.vidId});

  YoutubePlayerController genController(String vidId) {
    return YoutubePlayerController(
      initialVideoId: vidId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 28,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // width: MediaQuery.of(context).size.width,
              // height: 300,
              padding: const EdgeInsets.all(10),
              child: YoutubePlayer(
                controller: genController(vidId),
                liveUIColor: Colors.blue,
                // aspectRatio: ,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
