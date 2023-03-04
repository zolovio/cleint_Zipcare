import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final faqProvider = ChangeNotifierProvider.autoDispose((ref) => FAQController());

class FAQController extends ChangeNotifier {
  FAQController();

  bool isExpanded = true;

  String faqDescription =
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
