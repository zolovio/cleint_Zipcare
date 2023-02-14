import 'dart:async';

import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/features/auth/registration/ui/signup/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: lightWhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace),
          color: blackColor,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.2,
        decoration: const BoxDecoration(
          color: lightWhiteColor,
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
                'Email Verification',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  color: blackColor,
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
                'assets/images/intro/email.png',
                width: 250.0,
                height: 250.0,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              alignment: Alignment.center,
              child: Text(
                'Enter your OTP code here',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  color: descGreyColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 40),
            OTPTextField(
              length: 4,
              otpFieldStyle: OtpFieldStyle(borderColor: fieldBorderColor),
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
                    'Resend code in ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexend(
                      color: descGreyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    ' $minutes:$seconds',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexend(
                      color: primaryColor,
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
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegistrationScreen(),
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Text(
                  "Verify Now",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: whiteColor,
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
