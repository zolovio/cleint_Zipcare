import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = ChangeNotifierProvider.autoDispose((ref) => LoginController());

class LoginController extends ChangeNotifier {
  LoginController();

  bool isHide = false;

  void onPasswordHideChange() {
    isHide = !isHide;
    notifyListeners();
  }

  onForgotPassword() {
    navigatorKey.currentState?.pushNamed(AppRouter.forgotPassScreen);
  }

  onLogin() {
    navigatorKey.currentState?.pushNamed(AppRouter.homeScreen);
  }
}
