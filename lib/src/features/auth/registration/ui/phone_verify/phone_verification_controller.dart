import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final verifyPhoneProvider = ChangeNotifierProvider((ref) => PhoneVerificationController());

class PhoneVerificationController extends ChangeNotifier {
  PhoneVerificationController();
}
