import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onBoardProvider = ChangeNotifierProvider.autoDispose((ref) => OnBoardController());

class OnBoardController extends ChangeNotifier {
  OnBoardController();

  int currentPage = 0;

  void currentPageIndex(int page) {
    currentPage = page;
    notifyListeners();
  }

  void handleNavigation(GlobalKey<NavigatorState> navigatorKey) {
    navigatorKey.currentState?.pushNamed(AppRouter.phoneVerification);
  }
}
