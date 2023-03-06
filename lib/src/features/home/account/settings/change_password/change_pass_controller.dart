import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changePassProvider = ChangeNotifierProvider.autoDispose((ref) => ChangePasswordController());

class ChangePasswordController extends ChangeNotifier {
  ChangePasswordController();

  bool isHideOldPass = true;
  bool isHideNewPass = true;
  bool isHideConfirmPass = true;

  onOldPassVisibility() {
    isHideOldPass = !isHideOldPass;
    notifyListeners();
  }

  onNewPassVisibility() {
    isHideNewPass = !isHideNewPass;
    notifyListeners();
  }

  onConfirmPassVisibility() {
    isHideConfirmPass = !isHideConfirmPass;
    notifyListeners();
  }

  onPasswordChange() {
    navigatorKey.currentState?.pushNamed(AppRouter.passChanged);
  }
}
