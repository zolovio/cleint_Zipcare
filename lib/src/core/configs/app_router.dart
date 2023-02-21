import 'package:client_zipcare/src/features/auth/login/forgot_password/forgot_password_screen.dart';
import 'package:client_zipcare/src/features/auth/login/login/login_screen.dart';
import 'package:client_zipcare/src/features/auth/onboard/onboard_screen.dart';
import 'package:client_zipcare/src/features/auth/registration/ui/email_verify/email_verification.dart';
import 'package:client_zipcare/src/features/auth/registration/ui/phone_verify/phone_verification.dart';
import 'package:client_zipcare/src/features/auth/registration/ui/signup/registration_screen.dart';
import 'package:client_zipcare/src/features/home/home_page.dart';
import 'package:client_zipcare/src/features/home/job_post/job_post_screen.dart';
import 'package:client_zipcare/src/features/home/job_post/payment/card/add_card.dart';
import 'package:client_zipcare/src/features/home/job_post/payment/payment_page.dart';
import 'package:client_zipcare/src/features/home/profile/add_new_profile.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String onBoardScreen = '/onboard';
  static const String phoneVerification = '/phone';
  static const String emailVerification = '/email';
  static const String signUpScreen = '/signup';
  static const String loginScreen = '/login';
  static const String forgotPassScreen = '/forgot_pass';
  static const String homeScreen = '/home';
  static const String messageScreen = '/message';
  static const String jobPostScreen = '/create_job';
  static const String addNewProfile = '/add_new_profile';
  static const String paymentScreen = '/payment';
  static const String addCardScreen = '/add_card';

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
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case jobPostScreen:
        return MaterialPageRoute(builder: (_) => JobPostScreen());
      case addNewProfile:
        return MaterialPageRoute(builder: (_) => AddNewProfile());
      case AppRouter.paymentScreen:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case AppRouter.addCardScreen:
        return MaterialPageRoute(builder: (_) => AddNewCard());
      default:
        return null;
    }
  }
}
