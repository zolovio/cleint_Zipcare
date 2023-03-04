import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helpProvider = ChangeNotifierProvider.autoDispose((ref) => HelpController());

class HelpController extends ChangeNotifier {
  HelpController();

  bool isExpanded = true;

  String helpDescription =
      "A payment gateway is an ecommerce service that processes online payments for online as well"
      " as offline businesses. Payment gateways help accept payments by transferring key "
      "information from their merchant websites to issuing banks, card associations and online "
      "wallet players.\nPayment gateways play a vital role in the online transaction process, which "
      "is the realisation of value, and hence are seen as an important pillar of ecommerce.";

  onExpand(bool value) {
    isExpanded = value;
    notifyListeners();
  }
}
