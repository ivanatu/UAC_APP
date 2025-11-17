import 'package:uac/exports/exports.dart';

class HivTrivaPage extends StatefulWidget {
  const HivTrivaPage({super.key});

  @override
  State<HivTrivaPage> createState() => _HivTrivaPageState();
}

class _HivTrivaPageState extends State<HivTrivaPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HIV Trivia",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.apply(fontWeightDelta: 2),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.psychology_outlined,
                      size: 100,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Coming Soon",
                    style: Theme.of(context).textTheme.headlineMedium!.apply(
                      fontWeightDelta: 3,
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "HIV Trivia Challenge",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.apply(fontWeightDelta: 1),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      "We're working hard to bring you an interactive trivia experience to test your knowledge about HIV/AIDS. Stay tuned!",
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: Colors.grey.shade700,
                        heightFactor: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 16,
                  //     vertical: 8,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //       colors: [
                  //         Theme.of(context).primaryColor.withValues(alpha: 0.2),
                  //         Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  //       ],
                  //     ),
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Icon(
                  //         Icons.schedule,
                  //         size: 18,
                  //         color: Theme.of(context).primaryColor,
                  //       ),
                  //       const SizedBox(width: 8),
                  //       Text(
                  //         "In Development",
                  //         style: TextStyle(
                  //           color: Theme.of(context).primaryColor,
                  //           fontWeight: FontWeight.w600,
                  //           fontSize: 14,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
