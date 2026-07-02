import "controllers/regional_controller.dart";
import "controllers/virus_details_controller.dart";
import "exports/exports.dart";
import "controllers/national_prevalence_controller.dart";

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
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  // style native ui
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataController()),
        ChangeNotifierProvider(create: (context) => ZDrawerController()),
        ChangeNotifierProvider(create: (context) => FaqaController()),
        ChangeNotifierProvider(create: (context) => Progress95Controller()),
        ChangeNotifierProvider(create: (context) => AidsInfoController()),
        ChangeNotifierProvider(create: (context) => VideoUpdatesController()),
        ChangeNotifierProvider(create: (context) => MythController()),
        ChangeNotifierProvider(create: (context) => PrecautionController()),
        ChangeNotifierProvider(create: (context) => StoriesController()),
        ChangeNotifierProvider(create: (context) => VirusDetailsController()),
        ChangeNotifierProvider(
          create: (context) => NationalPrevalenceController(),
        ),
        ChangeNotifierProvider(create: (context) => RegionalController()),
        ChangeNotifierProvider(create: (context) => TriviaController()),
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
