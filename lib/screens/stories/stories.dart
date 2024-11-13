import '/screens/stories/stories_details.dart';
import '/exports/exports.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Hero(
          tag: "stories",
          child: Text(
            "Stories",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<StoriesController>(
          builder: (context, controller, _) {
            if (mounted) {
              controller.getStories();
            }

            if (controller.isLoading) {
              return Center(
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 800),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: const CircularProgressIndicator(),
                    );
                  },
                ),
              );
            }

            if (controller.stories.isEmpty) {
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: value,
                          child: SvgPicture.asset(
                            "assets/svgs/no_faq.svg",
                            height: 200,
                            width: 200,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.5),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.easeOut,
                          )),
                          child: Text(
                            "No Stories Available",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontFamily: 'Monospace',
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.7),
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Featured Story Section
                if (controller.stories.isNotEmpty)
                  SliverToBoxAdapter(
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.2),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeOut,
                      )),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Container(
                          height: 240,
                          margin: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                          child: _FeaturedStoryCard(
                            story: controller.stories[0],
                            onTap: () => _navigateToStoryDetails(
                              controller.stories[0],
                              context,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                // Rest of the Stories Grid
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final storyIndex = index + 1;
                        if (storyIndex >= controller.stories.length)
                          return null;

                        return AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            final delay = (index * 0.2).clamp(0.0, 1.0);
                            final slideAnimation = CurvedAnimation(
                              parent: _animationController,
                              curve: Interval(
                                delay,
                                1.0,
                                curve: Curves.easeOut,
                              ),
                            );

                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.5),
                                end: Offset.zero,
                              ).animate(slideAnimation),
                              child: FadeTransition(
                                opacity: slideAnimation,
                                child: child,
                              ),
                            );
                          },
                          child: _StoryCard(
                            story: controller.stories[storyIndex],
                            onTap: () => _navigateToStoryDetails(
                              controller.stories[storyIndex],
                              context,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _getImageUrl(dynamic story) {
    return Apis.url + story.attributes.image.data.attributes.url;
  }

  void _navigateToStoryDetails(dynamic story, BuildContext context) {
    Routes.animateToPage(
      StoriesDetails(
        title: story.attributes.title,
        description: story.attributes.description,
        image: _getImageUrl(story),
      ),
    );
  }
}

class _FeaturedStoryCard extends StatefulWidget {
  final dynamic story;
  final VoidCallback onTap;

  const _FeaturedStoryCard({
    required this.story,
    required this.onTap,
  });

  @override
  State<_FeaturedStoryCard> createState() => _FeaturedStoryCardState();
}

class _FeaturedStoryCardState extends State<_FeaturedStoryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: Apis.url +
                    widget.story.attributes.image.data.attributes.url,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    Apis.url +
                        widget.story.attributes.image.data.attributes.url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Hero(
                  tag: widget.story.attributes.title,
                  child: Text(
                    widget.story.attributes.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoryCard extends StatefulWidget {
  final dynamic story;
  final VoidCallback onTap;

  const _StoryCard({
    required this.story,
    required this.onTap,
  });

  @override
  State<_StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<_StoryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Hero(
                      tag: Apis.url +
                          widget.story.attributes.image.data.attributes.url,
                      child: Image.network(
                        Apis.url +
                            widget.story.attributes.image.data.attributes.url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: widget.story.attributes.title,
                        child: Text(
                          widget.story.attributes.title,
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
