import "/exports/exports.dart";


var navigatorKey = GlobalKey<NavigatorState>();
BuildContext context = navigatorKey.currentState!.context;

void main() {
  // system ui settings
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);

  runApp(MaterialApp(
    navigatorKey:navigatorKey!,
    debugShowCheckedModeBanner: false,
    theme:Themes.lightTheme,
    initialRoute:Routes.splash,
  ));
 
}
