import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetails extends StatelessWidget {
  final String title;
  final String description;
  final String vidId;

  const VideoDetails(
      {super.key, this.title = "", this.description = "", this.vidId = ""});

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
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Video Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        // padding: const EdgeInsets.all(10),
        children: [
          Hero(
            tag: vidId,
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
    );
  }
}
