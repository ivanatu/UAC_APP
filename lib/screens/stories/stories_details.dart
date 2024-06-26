import '/exports/exports.dart';

class StoriesDetails extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  const StoriesDetails({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  State<StoriesDetails> createState() => _StoriesDetailsState();
}

class _StoriesDetailsState extends State<StoriesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: widget.title,
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Hero(tag: widget.image, child: Image.network(widget.image)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.description),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
