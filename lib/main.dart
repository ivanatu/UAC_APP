import "package:aids_awareness_app/services/storage_service.dart";

import "/exports/exports.dart";

var navigatorKey = GlobalKey<NavigatorState>();
BuildContext context = navigatorKey.currentState!.context;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //
  // system ui settings
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [],
  );
// style native ui
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataController(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        initialRoute: Routes.splash,
        routes: Routes.routes,
      ),
    ),
  );
}
