import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InfoDetails extends StatelessWidget {
  final dynamic article;

  const InfoDetails({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: article['photo']['data']['full_url'],
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                color: Colors.teal[800],
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article['title'],
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            // Text(
            //   article['title'],
            //   style: const TextStyle(
            //     fontSize: 16.0,
            //     fontStyle: FontStyle.italic,
            //   ),
            // ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article['description'],
                  style: TextStyle(
                    fontFamily: "Montserrat",
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
