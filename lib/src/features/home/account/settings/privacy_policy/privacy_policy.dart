import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(privacyPolicyText, true, context),
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
                  color: hintColor,
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
