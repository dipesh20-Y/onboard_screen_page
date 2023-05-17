import 'package:flutter/material.dart';
import 'package:introduction/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './intro_screens/intro_page1.dart';
import './intro_screens/intro_page2.dart';
import './intro_screens/intro_page3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // contorller to keep track of which page we're on
  PageController _controller = PageController();

  //keep track of if we are on the last page

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: <Widget>[
              IntroPage1(
                image: "image/logo2.jpg",
                title: "Welcome to Dog Scanner",
                description:
                    "Use your camera or upload your own photo from the gallery to identify dog breeds within seconds!",
              ),
              IntroPage2(
                image: "image/page3.jpg",
                title: 'Ensure image quality!!',
                description: 'Try to take a picture of the whole body. At least the head should be visible!',
              ),
              IntroPage3(
              ),
              
            ],
          ),
          // dot indicators
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                //dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                //next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('showHome', true);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
