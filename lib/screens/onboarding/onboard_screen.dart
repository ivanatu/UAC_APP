// ignore_for_file: file_names

import 'dart:async';

import 'package:aids_awareness_app/services/storage_service.dart';

import '/exports/exports.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();
  Timer? _timer;
  int page = 0;
  List<Map<String, String>> _onboardingData = [
    {
      'title': 'Welcome to the HIV Awareness App',
      'subtitle': 'Learn about HIV/AIDS and how to prevent it.',
      'image': 'assets/svgs/learn_about_hiv.svg',
    },
    {
      'title': 'Find Testing Centers Nearby',
      'subtitle': 'Locate clinics for HIV testing and counseling.',
      'image': 'assets/svgs/locate.svg',
    },
    {
      'title': 'Connect with Support Groups',
      'subtitle': 'Join communities for HIV awareness and support.',
      'image': 'assets/svgs/community.svg',
    },
  ];
  @override
  void initState() {
    super.initState();
// controlling the sliding animation
  }

  void nextPage() {
    if (mounted) {
      setState(() {
        page += 1;
      });

      if (page >= 3) {
        setState(() {
          page = -1;
        });
      } else {
        pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 800),
          curve: Curves.decelerate,
        );
      }
    }
    print(page);
  }

  @override
  void dispose() {
    pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 10,
              child: Hero(
                tag: "lib/images/img.png",
                child: Image.asset(
                  "lib/images/img.png",
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _onboardingData.length,
                    onPageChanged: (index) {
                      setState(() {
                        page = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: SvgPicture.asset(
                              _onboardingData[index]['image']!,
                              height: 310,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox.square(
                            dimension: 20,
                          ),
                          Text(
                            _onboardingData[index]['title']!,
                            style:
                                Theme.of(context).textTheme.titleLarge!.apply(
                                      fontWeightDelta: 8,
                                      fontSizeDelta: 5,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox.square(dimension: 5),
                          Text(
                            _onboardingData[index]['subtitle']!,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox.square(dimension: 20),
                SmoothPageIndicator(
                  controller: pageController,
                  onDotClicked: (index) {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  count: _onboardingData.length,
                  effect: WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    dotColor: Colors.grey.shade300,
                    activeDotColor: primaryColor,
                    type: WormType.normal,
                  ),
                ),
                const SizedBox.square(dimension: 10),
                Padding(
                  padding: EdgeInsets.fromLTRB(65, 5, 65, 5),
                  child: CustomButton(
                    text: page == 2 ? "Get Started" : "Next",
                    textColor: Colors.white,
                    opacity: 1,
                    fontSize: 3,
                    onPress: page >= 2
                        ? () async {
                            StorageService.saveData('new_user', 1);
                            Routes.replacePage(
                              const IndexScreen(),
                            );
                          }
                        : () => nextPage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
