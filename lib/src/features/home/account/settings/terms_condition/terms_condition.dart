import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsNCondition extends StatelessWidget {
  const TermsNCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, termConditionText, true, true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the "
                "visual form of a document or a typeface without relying\non meaningful content. "
                "Lorem ipsum may be used as a placeholder before the final copy is available. "
                "n publishing and graphic design, Lorem ipsum is a placeholder text commonly used to"
                " demonstrate the visual form of a document or a typeface without relying on meaningful content."
                " Lorem ipsum may be used as a placeholder before the final copy is available. "
                "\n\nPublishing and graphic design, Lorem ipsum is a placeholder text commonly used "
                "to demonstrate the visual form of a document or a typeface without relying \non meaningful"
                " content. Lorem ipsum may be used as a placeholder before the final copy is available."
                " n publishing and graphic design, Lorem ipsum is a placeholder text commonly used "
                "to demonstrate the visual form of a document or a typeface without relying on meaningful "
                "content. Lorem ipsum may be used as a placeholder before the final copy is available. ",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: AppColors.mediumSlateColor,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
