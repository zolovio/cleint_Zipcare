import 'dart:async';

import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationScreen> createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 5);

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    countdownTimer!.cancel();
    super.dispose();
  }

  /// Timer related methods ///
  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(1));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Scaffold(
      appBar: getSimpleAppBar(context),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.2,
        decoration: const BoxDecoration(
          color: AppColors.lightWhiteColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              alignment: Alignment.center,
              child: Text(
                phoneVerifyText,
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  color: AppColors.blackColor,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 250,
              width: 250,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/intro/phone.png',
                width: 250.0,
                height: 250.0,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              alignment: Alignment.center,
              child: Text(
                enterOtpText,
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  color: AppColors.darkGreyColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 40),
            OTPTextField(
              length: 4,
              otpFieldStyle: OtpFieldStyle(borderColor: AppColors.lightSlateColor),
              width: MediaQuery.of(context).size.width,
              style: GoogleFonts.lexend(fontSize: 32, fontWeight: FontWeight.w500),
              spaceBetween: 20,
              textFieldAlignment: MainAxisAlignment.center,
              fieldWidth: 50,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
              onChanged: (pin) {
                print("Changed: " + pin);
              },
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    resendCodeText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexend(
                      color: AppColors.darkGreyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    ' $minutes:$seconds',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexend(
                      color: AppColors.darkPurpleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => navigatorKey.currentState?.pushNamed(AppRouter.emailVerification),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkPurpleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Text(
                  verifyNowText,
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
