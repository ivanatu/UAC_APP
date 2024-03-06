import 'package:aids_awareness_app/utils/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'VideoDetails.dart';

class Video extends StatefulWidget {
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  bool isLoading = true;
  final link = "$BASE_URL/aids_awareness_videos";
  List<dynamic> collectedData = [];

  Future<void> fetchData() async {
    final result = await http.get(Uri.parse(link));

    if (result.statusCode == 200) {
      final content = jsonDecode(result.body);

      final data = content["data"];

      setState(() {
        collectedData = data;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    fetchData();
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
        body: Container(
            margin: const EdgeInsets.all(10.0),
            child: isLoading
                ? const Center(
                    child: SpinKitFadingCircle(
                      color: Colors.black,
                      size: 30.0,
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: collectedData.length,
                    itemBuilder: (context, index) {
                      final data = collectedData[index];
                      return buildVid(
                          data['title'],
                          data['description'],
                          data['video_url'].substring(
                              data['video_url'].lastIndexOf("/") + 1));
                    },
                  )));
  }

  Widget buildVid(String title, String description, String vidId) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          YoutubePlayer(
            controller: genController(vidId),
            liveUIColor: Colors.blue,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.black), // Set the background color
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VideoDetails(
                        title: title, description: description, vidId: vidId)));
              },
              child: const Text("Watch Video Details")),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  YoutubePlayerController genController(String vidId) {
    return YoutubePlayerController(
      initialVideoId: vidId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }
}
