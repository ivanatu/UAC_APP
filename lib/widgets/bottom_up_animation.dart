import '/exports/exports.dart';

class BottomTopMoveAnimationView extends StatefulWidget {
  final Widget child;

  const BottomTopMoveAnimationView({super.key, required this.child});

  @override
  State<BottomTopMoveAnimationView> createState() =>
      _BottomTopMoveAnimationViewState();
}

class _BottomTopMoveAnimationViewState extends State<BottomTopMoveAnimationView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animationController!,
          // FadeTransition and Transform : just for screen loading animation on fistTime
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 40 * (1.0 - animationController!.value), 0.0),
            child: child,
          ),
        );
      },
    );
  }
}
