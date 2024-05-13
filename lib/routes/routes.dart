import '/exports/exports.dart';

class Routes {
  // routes definition
  static String splash = "/splash";
  static String onboard = "/splash/onboard";
  static String home = "/home";
  // routes merger
  static Map<String, Widget Function(BuildContext context)> routes = {
    splash:(context) => SplashScreen(),
    onboard:(context) => OnBoardingScreen(),
    home:(context) => HomeScreen(),
  };
  // routes methods
  static void pop() {
    Navigator.of(context).pop();
  }

  static void pushPage(String route) {
    Navigator.of(context).pushNamed(route);
  }

  static void pushReplace(String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  static void replacePage(Widget route) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => route, fullscreenDialog: true),
    );
  }

  static void removePage(String route) {
    Navigator.of(context).popAndPushNamed(route);
  }

  static void removeUntilPage(String route) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
  }

  static void animateToPage(Widget page, {type = 'fade'}) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) => type == 'slide'
            ? SlideTransition(
                position: animation.drive(Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(
                    curve: Curves.decelerate,
                  ),
                )),
                child: page,
              )
            : FadeTransition(
                opacity: animation,
                child: page,
              ),
      ),
    );
  }
}
