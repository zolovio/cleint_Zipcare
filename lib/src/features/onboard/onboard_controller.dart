import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onBoardProvider = ChangeNotifierProvider.autoDispose((ref) => OnBoardController());

class OnBoardController extends ChangeNotifier {
  OnBoardController() {
    onLoad();
  }

  final PageController pageController = PageController(initialPage: 0);
  List<Pages> selectData = [];
  int selectedIndex = 0;

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

  void onLoad() {
    selectData.add(Pages(
      title: titles[0],
      desc: description[0],
      image: onboard1,
    ));
    selectData.add(Pages(
      title: titles[1],
      desc: description[2],
      image: onboard2,
    ));
    selectData.add(Pages(
      title: titles[2],
      desc: description[2],
      image: onboard3,
    ));
    selectData.add(Pages(
      title: titles[3],
      desc: description[3],
      image: onboard4,
    ));
  }

  void onPageChanged(int page) {
    selectedIndex = page;
    notifyListeners();
  }

  void handleNavigation(GlobalKey<NavigatorState> navigatorKey) {
    navigatorKey.currentState?.pushNamed(AppRouter.phoneVerification);
  }

  void onGetStarted() {
    navigatorKey.currentState?.pushNamed(AppRouter.loginScreen);
  }
}

class Pages {
  final title, desc, image;

  Pages({this.title, this.desc, this.image});
}
