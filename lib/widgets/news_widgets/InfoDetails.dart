import '/models/aids_info_model.dart';
import '/exports/exports.dart';

class InfoDetails extends StatelessWidget {
  final Datum article;

  const InfoDetails({required this.article});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: Apis.url + article.attributes.image.data.attributes.url,
            child: Image.network(
              Apis.url + article.attributes.image.data.attributes.url,
              errorBuilder: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.attributes.title,
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
            child: Text(article.attributes.description,
                style: TextStyle(
                  fontFamily: "Montserrat",
                )),
          ),
        ],
      ),
    );
  }
}
