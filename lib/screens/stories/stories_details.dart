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

class _StoriesDetailsState extends State<StoriesDetails>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  double _imageHeight = 400;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Parallax effect and fade for image
    setState(() {
      _opacity = (1 - (_scrollController.offset / _imageHeight)).clamp(
        0.2,
        1.0,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slideAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Image Section
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Hero(
                    tag: widget.image,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _opacity,
                      child: Container(
                        height: _imageHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.topCenter,
                        //   end: Alignment.bottomCenter,
                        //   colors: [
                        //     Colors.transparent,
                        //     Theme.of(context).colorScheme.background,
                        //   ],
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content Section
            SliverToBoxAdapter(
              child: Transform.translate(
                offset: const Offset(0, -0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Section
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.2),
                            end: Offset.zero,
                          ).animate(slideAnimation),
                          child: FadeTransition(
                            opacity: slideAnimation,
                            child: Hero(
                              tag: widget.title,
                              child: Text(
                                widget.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onBackground,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Description Section
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                        child: SlideTransition(
                          position:
                              Tween<Offset>(
                                begin: const Offset(0, 0.2),
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: _animationController,
                                  curve: const Interval(
                                    0.2,
                                    1.0,
                                    curve: Curves.easeOut,
                                  ),
                                ),
                              ),
                          child: FadeTransition(
                            opacity: CurvedAnimation(
                              parent: _animationController,
                              curve: const Interval(0.2, 1.0),
                            ),
                            child: _FormattedDescription(
                              description: widget.description,
                            ),
                          ),
                        ),
                      ),

                      // Share and Like Buttons
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                      //   child: FadeTransition(
                      //     opacity: CurvedAnimation(
                      //       parent: _animationController,
                      //       curve: const Interval(0.4, 1.0),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         _ActionButton(
                      //           icon: Icons.favorite_border,
                      //           label: 'Like',
                      //           onTap: () {},
                      //         ),
                      //         _ActionButton(
                      //           icon: Icons.share,
                      //           label: 'Share',
                      //           onTap: () {},
                      //         ),
                      //         _ActionButton(
                      //           icon: Icons.bookmark_border,
                      //           label: 'Save',
                      //           onTap: () {},
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormattedDescription extends StatelessWidget {
  final String description;

  const _FormattedDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        height: 1.6,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
