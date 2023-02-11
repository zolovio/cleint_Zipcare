import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController controller = PageController(initialPage: 0);

  int pageCount = 4;

  int currentPage = 0;

  List<String> titles = [
    "Find carers in Minutes",
    "In-depth insights to carer profiles",
    "Find jobs that fit your lifestyle",
    "Get paid more and quickly",
  ];

  List<String> description = [
    "Jointly is an innovative mobile and online app that is designed by carers for carers. Jointly makes caring easier.",
    "Jointly is an innovative mobile and online app that is designed by carers for carers. Jointly makes caring easier.",
    "Jointly is an innovative mobile and online app that is designed by carers for carers. Jointly makes caring easier.",
    "Jointly is an innovative mobile and online app that is designed by carers for carers. Jointly makes caring easier.",
  ];

  List<String> images = [
    "assets/images/intro/onboard1.png",
    "assets/images/intro/onboard2.png",
    "assets/images/intro/onboard3.png",
    "assets/images/intro/onboard4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: pageCount,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    color: purpleColor,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.2,
                    decoration: const BoxDecoration(
                      color: lightWhiteColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                      ),
                    ),
                    child: ListView(
                      children: <Widget>[
                        const SizedBox(height: 70),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          alignment: Alignment.center,
                          child: Text(
                            titles[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lexend(
                              color: blackColor,
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          alignment: Alignment.center,
                          child: Text(
                            description[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lexend(
                              color: descGreyColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 250,
                          width: 250,
                          alignment: Alignment.center,
                          child: Image.asset(
                            images[index],
                            width: 250.0,
                            height: 250.0,
                          ),
                        ),
                        const SizedBox(height: 80),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 4,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          controller.animateToPage(
                                            index,
                                            duration: const Duration(microseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                        },
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Center(
                                            child: AnimatedContainer(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: currentPage == index ? colorPrimarySwatch : colorGreySwatch,
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                              duration: const Duration(milliseconds: 00),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          (currentPage == pageCount - 1)
              ? Positioned(
                  bottom: 30,
                  left: MediaQuery.of(context).size.width * 0.32,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                      child: Text(
                        "Get Started!",
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                )
              : Positioned(
                  bottom: 30,
                  left: MediaQuery.of(context).size.width * 0.36,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.jumpToPage(pageCount - 1);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: Text(
                        "Skip",
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
