import 'package:client_zipcare/src/features/auth/login/forgot_password/forgot_password_screen.dart';
import 'package:client_zipcare/src/features/auth/login/login/login_screen.dart';
import 'package:client_zipcare/src/features/auth/onboard/onboard_screen.dart';
import 'package:client_zipcare/src/features/auth/registration/ui/email_verify/email_verification.dart';
import 'package:client_zipcare/src/features/auth/registration/ui/phone_verify/phone_verification.dart';
import 'package:client_zipcare/src/features/auth/registration/ui/signup/registration_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String onBoardScreen = '/onboard';
  static const String phoneVerification = '/phone';
  static const String emailVerification = '/email';
  static const String signUpScreen = '/signup';
  static const String loginScreen = '/login';
  static const String forgotPassScreen = '/forgot_pass';
  static const String messageScreen = '/message';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardScreen:
        return MaterialPageRoute(builder: (_) => OnBoardScreen());
      case phoneVerification:
        return MaterialPageRoute(builder: (_) => const PhoneVerificationScreen());
      case emailVerification:
        return MaterialPageRoute(builder: (_) => const EmailVerificationScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case forgotPassScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      // case messageScreen:
      //   return MaterialPageRoute(builder: (_) => const ChatWindow());
      default:
        return null;
    }
  }
}
