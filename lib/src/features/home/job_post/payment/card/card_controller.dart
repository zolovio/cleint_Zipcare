import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardProvider = ChangeNotifierProvider.autoDispose((ref) => CardController());

class CardController extends ChangeNotifier {
  CardController();

  String cardNumber = '';
  String expiryDate = 'XX/XX';
  String cardHolderName = '';
  String cvvCode = '';

  bool isCvvFocused = false;

  OutlineInputBorder? border = const OutlineInputBorder(
    borderSide: BorderSide(
      color: hintLightColor,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    cardNumber = creditCardModel!.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;

    notifyListeners();
  }

  void setDate(String value) {
    expiryDate = value;
    notifyListeners();
  }
}
