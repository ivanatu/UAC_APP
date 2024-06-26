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
        ChangeNotifierProvider(
          create: (context) => ZDrawerController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FaqaController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Progress95Controller(),
        ),
        ChangeNotifierProvider(
          create: (context) => AidsInfoController(),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoUpdatesController(),
        ),
        ChangeNotifierProvider(
          create: (context) => MythController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PrecautionController(),
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
