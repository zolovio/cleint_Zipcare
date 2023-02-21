import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentProvider = ChangeNotifierProvider((ref) => PaymentController());

class PaymentController extends ChangeNotifier {
  PaymentController();

  List<List<String>> paymentMethodsList = [
    [paypal, "Paypal", "pay"],
    [googlePay, "Google Pay", "pay"],
    [applePay, "Apple Pay", "pay"],
    [debitCard, "**** **** **** 9659", "debit"],
    [coupon, "Coupons/code", "coupon"],
  ];
}
