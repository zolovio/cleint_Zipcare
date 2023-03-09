import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forgotPassProvider = ChangeNotifierProvider.autoDispose((ref) => ForgotPasswordController());

class ForgotPasswordController extends ChangeNotifier {
  ForgotPasswordController();
}
