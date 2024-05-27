// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import '/exports/exports.dart';
import 'InfoDetails.dart';

// ignore: must_be_immutable
class NewsTile extends StatelessWidget {
  final Map<String, dynamic> article;

  const NewsTile({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Routes.animateToPage(
          InfoDetails(article: article),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 95,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          ),
        ),
        child: LayoutBuilder(
          builder: (ctx, constraint) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //News image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: article['photo']['data']['full_url'],
                    child: Image.network(
                      article['photo']['data']['thumbnails'][0]['url'],
                      fit: BoxFit.cover,
                      width: 75,
                      height: 75,
                      errorBuilder: (context, url, dynamic) {
                        return Container(
                          width: 95,
                          height: 95,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/updates/news.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(width: 8),

              //Column of title and description
              SizedBox(
                width: constraint.maxWidth * 0.7,
                child: AutoSizeText.rich(
                  TextSpan(
                      text: "\n${article["title"]}",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: article["description"] == null
                              ? "\nRead More for Details"
                              : "\n${article["description"]}",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 11.5,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  stepGranularity: 1,
                  maxFontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
