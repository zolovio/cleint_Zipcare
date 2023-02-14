import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final verifyEmailProvider = ChangeNotifierProvider.autoDispose((ref) => EmailVerificationController());

class EmailVerificationController extends ChangeNotifier {
  EmailVerificationController();
}
