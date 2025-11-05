import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constant/color.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  int currentPage = 0;

  List<Map<String, dynamic>> images = [
    {'title': 'Welcome to Phone Care', 'path': 'assets/images/logo.png'},
    {'title': 'Welcome to Phone Care', 'path': 'assets/images/logo.png'},
    {'title': 'Welcome to Phone Care', 'path': 'assets/images/logo.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    double? imageWidth;
    double? imageHeight;
    double? fontSize;

    if (width < 600) {
      // 📱 Mobile
      imageWidth = width * 0.45;
      imageHeight = height * 0.2;
      fontSize = 20;
    } else if (width < 1024) {
      // 💻 Tablet
      imageWidth = width * 0.35;
      imageHeight = height * 0.25;
      fontSize = 25;
    } else {
      // 🖥️ Desktop/Web
      imageWidth = width * 0.25;
      imageHeight = height * 0.25;
      fontSize = 30;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      images[index]['path'],
                      width: imageWidth,
                      height: imageHeight,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      images[index]['title'],
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: images.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColor.primaryColor,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                const SizedBox(height: 20),
                if (currentPage == images.length - 1)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.goNamed('login');
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.goNamed('login');
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.primaryColor,
                        ),
                        child: TextButton(
                          onPressed: () {
                            pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
