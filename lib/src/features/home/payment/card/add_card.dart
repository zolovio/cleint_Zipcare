import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/payment/card/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddNewCard extends ConsumerWidget {
  AddNewCard({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardController = ref.watch(cardProvider);

    return Scaffold(
      appBar: getAppBar(newCardText, true, context),
      body: ListView(
        children: [
          CreditCardWidget(
            cardNumber: cardController.cardNumber,
            expiryDate: cardController.expiryDate,
            cardHolderName: cardController.cardHolderName,
            cvvCode: cardController.cvvCode,
            showBackView: cardController.isCvvFocused,
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            cardBgColor: AppColors.darkPurpleColor,
            isSwipeGestureEnabled: true,
            bankName: " ",
            // backgroundImage: card,
            cardType: CardType.mastercard,
            onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            customCardTypeIcons: <CustomCardTypeIcon>[
              CustomCardTypeIcon(
                cardType: CardType.mastercard,
                cardImage: Image.asset(debitCard, height: 48, width: 48),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              CreditCardForm(
                formKey: formKey,
                cardNumber: cardController.cardNumber,
                cvvCode: cardController.cvvCode,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardHolderName: cardController.cardHolderName,
                expiryDate: cardController.expiryDate,
                themeColor: AppColors.darkPurpleColor,
                textColor: AppColors.blackColor,
                cardNumberDecoration: InputDecoration(
                  labelText: 'Card Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: GoogleFonts.lexend(
                      color: AppColors.deepGreyColor, fontWeight: FontWeight.w400, fontSize: 14),
                  labelStyle: GoogleFonts.lexend(
                      color: AppColors.deepGreyColor, fontWeight: FontWeight.w400, fontSize: 14),
                  focusedBorder: cardController.border,
                  enabledBorder: cardController.border,
                ),
                expiryDateDecoration: InputDecoration(
                  hintStyle: GoogleFonts.lexend(
                      color: AppColors.deepGreyColor, fontWeight: FontWeight.w400, fontSize: 14),
                  labelStyle: GoogleFonts.lexend(
                      color: AppColors.deepGreyColor, fontWeight: FontWeight.w400, fontSize: 14),
                  focusedBorder: cardController.border,
                  enabledBorder: cardController.border,
                  labelText: 'Expire Date',
                  hintText: cardController.expiryDate,
                  suffixIcon: InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000));

                        if (pickedDate != null) {
                          String formattedDate = DateFormat('MM/dd').format(pickedDate);

                          cardController.setDate(formattedDate);
                        }
                      },
                      child: Image.asset(expiryDate)),
                ),
                cvvCodeDecoration: InputDecoration(
                  hintStyle: GoogleFonts.lexend(
                      color: AppColors.deepGreyColor, fontWeight: FontWeight.w400, fontSize: 14),
                  labelStyle: GoogleFonts.lexend(
                      color: AppColors.deepGreyColor, fontWeight: FontWeight.w400, fontSize: 14),
                  focusedBorder: cardController.border,
                  enabledBorder: cardController.border,
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: InputDecoration(
                  hintStyle: GoogleFonts.lexend(
                      color: AppColors.deepGreyColor, fontWeight: FontWeight.w400, fontSize: 14),
                  labelStyle: GoogleFonts.lexend(
                      color: AppColors.deepGreyColor, fontWeight: FontWeight.w400, fontSize: 14),
                  focusedBorder: cardController.border,
                  enabledBorder: cardController.border,
                  labelText: 'Card Holder',
                ),
                onCreditCardModelChange: cardController.onCreditCardModelChange,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: _onValidate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkPurpleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                              child: Text(
                                saveText,
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Image.asset(save),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }
}
