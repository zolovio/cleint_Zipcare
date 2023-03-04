import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = ChangeNotifierProvider.autoDispose((ref) => SettingsController());

class SettingsController extends ChangeNotifier {
  SettingsController();

  bool switchApplicationMode = true;

  List<Map<String, String>> settingTabs = [
    {"title": "Notification", "route": ""},
    {"title": "Change Password", "route": AppRouter.changePass},
    {"title": "Payment", "route": AppRouter.paymentScreen},
    {"title": "About Us", "route": AppRouter.aboutUs},
    {"title": "Terms and Conditions", "route": AppRouter.termsCondition},
    {"title": "Privacy Policy", "route": AppRouter.privacyPolicy},
  ];

  onSwitchApplicationMode() {
    switchApplicationMode = !switchApplicationMode;
    notifyListeners();
  }

  onTileTap(String route) {
    navigatorKey.currentState?.pushNamed(route);
  }
}
