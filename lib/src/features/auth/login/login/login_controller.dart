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
}
