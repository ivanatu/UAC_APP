import '../../services/storage_service.dart';
import '/exports/exports.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );
    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    );
    _animationController?.forward();
    Future.delayed(Duration(seconds: 3), () async {
      int? user = await StorageService.getData('new_user');
      if (user == null) {
        Routes.replacePage(
          const OnBoardingScreen(),
        );
        // await StorageService.setData('new_user', 1);
      } else {
        Routes.replacePage(
          IndexScreen(),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation!,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Hero(
                tag: "lib/images/img.png",
                child: Image.asset(
                  "lib/images/img.png",
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            SpinKitFadingCircle(
              color: Theme.of(context).primaryColor,
              size: 50.0,
            ),
            SizedBox(
              height: 20,
            ),
            // Text(
            //   "Be alert, HIV/AIDS is real, and its amongst us!",
            //   style: Theme.of(context).textTheme.titleMedium!.apply(
            //       color: Theme.of(context).primaryColor,
            //       fontSizeDelta: 2,
            //       fontWeightDelta: 1),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 3,
            ),
          ],
        ),
      ),
    );
  }
}
