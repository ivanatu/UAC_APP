// ignore_for_file: deprecated_member_use

import '/exports/exports.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  // String _currentVersion = '';
  // String _latestVersion = '';
  // Future<void> _checkForUpdates() async {
  //   // Retrieve the current version of the app
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   setState(() {
  //     _currentVersion = packageInfo.version;
  //   });
  //   // log("Current Version: $_currentVersion");
  //   // Make an API call to get the latest version from the server
  //   String latestVersion = await UpdateService.getVersion();

  //   // Compare versions and prompt for an update if necessary
  //  if(latestVersion.isNotEmpty){
  //    if (_currentVersion != latestVersion) {
  //     if (mounted) {
  //       setState(() {
  //         _latestVersion = latestVersion;
  //       });
  //       showUpdateDialog(
  //           latestVersion: _latestVersion, version: _currentVersion);
  //     }
  //   }
  //  }
  // }

  @override
  void initState() {
    super.initState();
    //  _checkForUpdates();
  }

  // selected nav item
  int selected = 0;

  final String ext = "assets/bottom_navs/";
  List<Map<String, dynamic>> bottomNavs = [
    {"label": "Home", "icon": "home.svg", "un": "home_un.svg"},
    {"label": "News", "icon": "livescore.svg", "un": "livescore_un.svg"},
    {"label": "Messages", "icon": "message.svg", "un": "message_un.svg"},
    {"label": "Stats", "icon": "stats.svg", "un": "stats_un.svg"},
    {"label": "Chat", "icon": "chat.svg", "un": "chat_un.svg"},
  ];
  // page controller
  final PageController pageController = PageController();

  // pages to render
  List<Widget> pages = [
    HomeScreen(),
    NewsPage(),
    MessagesScreen(),
    StatsPage(),
    ChatScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pages.length,
        controller: pageController,
        itemBuilder: (context, page) => pages[page],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 700),
            curve: Curves.ease,
          );
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        selectedIconTheme: const IconThemeData(size: 30),
        currentIndex: selected,
        items: List.generate(
          bottomNavs.length,
          (index) => BottomNavigationBarItem(
            label: bottomNavs[index]['label'],
            icon: SvgPicture.asset(
              "$ext${selected == index ? bottomNavs[index]['icon'] : bottomNavs[index]['un']}",
              color: selected == index ? primaryColor : Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}
