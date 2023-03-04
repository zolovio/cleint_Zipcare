import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registrationProvider =
    ChangeNotifierProvider.autoDispose<RegistrationController>((ref) => RegistrationController());

class RegistrationController extends ChangeNotifier {
  RegistrationController();

  bool isBusiness = false;

  bool isHide = false;

  String countryName = '';

  void onBusinessSelected() {
    isBusiness = !isBusiness;
    notifyListeners();
  }

  void onPasswordHideChange() {
    isHide = !isHide;
    notifyListeners();
  }

  void changeCountry(String cName) {
    countryName = cName;
    notifyListeners();
  }

  onLogin() {
    navigatorKey.currentState?.pushNamed(AppRouter.loginScreen);
  }
}
