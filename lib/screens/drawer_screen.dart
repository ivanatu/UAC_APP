import 'package:aids_awareness_app/screens/about/about_uac.dart';
import 'package:aids_awareness_app/screens/faqs/faqs_page.dart';

import '../controllers/drawer_controller.dart';
import '/exports/exports.dart';
import 'stories/stories.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space(
              space: 0.3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: Hero(
                      tag: "side_image",
                      child: Image.asset(
                        "lib/images/img.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  Space(
                    space: 0.041,
                  ),
                  Text(
                    "(UAC)\n",
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                          color: Colors.white,
                          fontWeightDelta: 10,
                        ),
                  ),
                ],
              ),
            ),
            Space(),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                "UGANDA AIDS COMMISSION",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeightDelta: 5,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Divider(),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/bottom_navs/home.svg",
                  color: Colors.white),
              title: const Text('Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  )),
              onTap: () =>
                  Provider.of<ZDrawerController>(context, listen: false)
                      .toggleDrawerSelected(),
            ),
            ListTile(
                leading: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: Hero(
                  tag: "about_uac",
                  child: const Text(
                    'About',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onTap: () {
                  Provider.of<ZDrawerController>(context, listen: false)
                      .toggleDrawerSelected();
                  // navigate to about screen
                  Routes.animateToPage(AboutUac());
                }),
            ListTile(
              leading:
                  SvgPicture.asset("assets/svgs/faqs.svg", color: Colors.white),
              title: const Text(
                'FAQs',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Provider.of<ZDrawerController>(context, listen: false)
                    .toggleDrawerSelected();
                // navigate to faqs screen
                Routes.animateToPage(FaqsPage());
              },
            ),
            ListTile(
                leading: Icon(Icons.message, color: Colors.white),
                title: const Text(
                  'Stories',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  Provider.of<ZDrawerController>(context, listen: false)
                      .toggleDrawerSelected();

                  // navigate to stories screen
                  Routes.animateToPage(Stories());
                }),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
