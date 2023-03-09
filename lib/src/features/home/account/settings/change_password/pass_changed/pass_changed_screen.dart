import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PassChangedScreen extends StatelessWidget {
  const PassChangedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "", true, true),
      body: ListView(
        children: [
          Center(
            child: Text(
              passChangedText,
              style: GoogleFonts.lexend(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            passChanged,
            height: 200,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: Text(
              "Your password has been successfully changed.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lexend(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () => navigatorKey.currentState?.pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkPurpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                    child: Text(
                      goBackText,
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
        ],
      ),
    );
  }
}
