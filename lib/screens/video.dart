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
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "AIDS Awareness Videos",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: isLoading
            ? const Center(
                child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 30.0,
                ),
              )
            : Scrollbar(
                thickness: 5,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: collectedData.length,
                  itemBuilder: (context, index) {
                    final data = collectedData[index];
                    return buildVid(
                        data['title'],
                        data['description'],
                        data['video_url']
                            .substring(data['video_url'].lastIndexOf("/") + 1));
                  },
                ),
              ),
      ),
    );
  }

  Widget buildVid(String title, String description, String vidId) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Hero(
              tag: vidId,
              child: YoutubePlayer(
                controller: genController(vidId),
                liveUIColor: Colors.blue,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: TextButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VideoDetails(
                      title: title,
                      description: description,
                      vidId: vidId,
                    ),
                  ),
                );
              },
              label: Icon(Icons.open_in_new),
              icon: Text("View Details"),
            ),
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
