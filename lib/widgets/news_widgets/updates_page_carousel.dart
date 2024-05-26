import '../widgets/custom_slider.dart';
import '/exports/exports.dart';

class ImageCarousel extends StatefulWidget {
  final height;

  const ImageCarousel({super.key, required this.height});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return CustomSlider(
      items: [
        "assets/updates/news1.png",
        "assets/updates/news2.png",
        "assets/updates/news4.png",
        "assets/updates/news5.png",
        "assets/updates/news6.png",
        "assets/updates/news7.png"
      ],
      options: CustomOptions(
        initialPage: 0,
        curves: Curves.linearToEaseOut,
        slideDuration: Duration(seconds: 5),
        // viewportFraction: 1.2,
        height: widget.height,
      ),
    );
  }
}
