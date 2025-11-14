// ignore_for_file: deprecated_member_use

import '/models/aids_info_model.dart';
import '/exports/exports.dart';

class InfoDetails extends StatelessWidget {
  final Datum article;

  const InfoDetails({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App bar with back button that's always visible
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            pinned: true,
            leading: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: BackButton(color: Colors.white),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Hero image
                  Hero(
                    tag:
                        Apis.url + article.attributes.image.data.attributes.url,
                    child: Image.network(
                      Apis.url + article.attributes.image.data.attributes.url,
                      fit: BoxFit.cover,
                      errorBuilder: (context, url, error) => Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.error, size: 48),
                      ),
                    ),
                  ),
                  // Gradient overlay for better visibility
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                          Colors.white.withOpacity(0.8),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content section
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      article.attributes.title,
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                        height: 1.3,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 12.0),

                    // Divider for visual separation
                    Container(
                      width: 60,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // Description with better readability
                    Text(
                      article.attributes.description,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16.0,
                        height: 1.7,
                        letterSpacing: 0.3,
                        color: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.color?.withOpacity(0.87),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 32.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
