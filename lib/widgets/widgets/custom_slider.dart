import 'dart:async';

import '/exports/exports.dart';

class CustomSlider extends StatefulWidget {
  final int initialPage;
  final List<dynamic> items;
  final Duration slideDuration;
  final CustomOptions options;
  final ValueChanged<int>? onPageChanged;
  const CustomSlider({
    super.key,
    this.initialPage = 0,
    required this.items,
    this.slideDuration = const Duration(seconds: 5),
    this.options = const CustomOptions(),
    this.onPageChanged,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  PageController? pageController;

  Timer? timer;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.options.initialPage);

    timer = Timer.periodic(widget.options.slideDuration, (timer) {
      if (pageController?.page == widget.items.length - 1) {
        pageController?.jumpToPage(0);
      } else {
        pageController?.nextPage(
          duration: Duration(milliseconds: 500),
          curve: widget.options.curves,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.items.length,
      onPageChanged: widget.onPageChanged,
      itemBuilder: (context, index) {
        return Container(
          height: widget.options.height,
          margin: widget.options.margin,
          decoration: BoxDecoration(
            color: widget.options.color,
            borderRadius: widget.options.borderRadius,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                widget.items.elementAt(index),
              ),
            ),
          ),
        );
      },
    );
  }
}

// options
class CustomOptions {
  final Duration slideDuration;
  final Cubic curves;
  final int initialPage;
  final EdgeInsetsGeometry margin;
  final double height;
  final Color color;
  final BorderRadiusGeometry borderRadius;
  final double viewportFraction;
  const CustomOptions({
    this.height = 200,
    this.initialPage = 0,
    this.borderRadius = BorderRadius.zero,
    this.margin = const EdgeInsets.all(10),
    this.color = Colors.white,
    this.slideDuration = const Duration(seconds: 5),
    this.curves = Curves.easeIn,
    this.viewportFraction = 1.2,
  });
}
