import 'package:client_zipcare/src/features/auth/onboard/onboard_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splashScreen = '/onboard';
  static const String signUpScreen = '/signup';
  static const String loginScreen = '/login';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => OnBoardScreen());
      default:
        return null;
    }
  }
}
