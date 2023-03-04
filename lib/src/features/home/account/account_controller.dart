import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountProvider = ChangeNotifierProvider.autoDispose((ref) => AccountController());

class AccountController extends ChangeNotifier {
  AccountController();

  double progress = 0.8;

  final List<Map<String, String>> profileCards = [
    {"title": "Profiles", "img": profile, "page": AppRouter.profiles},
    {"title": "help", "img": help, "page": AppRouter.help},
    {"title": "My reviews", "img": reviews, "page": AppRouter.reviews},
    {"title": "Settings", "img": settings, "page": AppRouter.settings},
    {"title": "FAQ", "img": faq, "page": AppRouter.faq},
  ];

  onCardTap(String page) {
    navigatorKey.currentState?.pushNamed(page);
  }

  onProfileView() {
    navigatorKey.currentState?.pushNamed(AppRouter.myProfile);
  }
}
