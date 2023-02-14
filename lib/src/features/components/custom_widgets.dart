import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWidgets {
  AppBar getAppBar(String title) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: true,
      backgroundColor: lightWhiteColor,
      iconTheme: const IconThemeData(color: blackColor),
      title: Text(
        title,
        style: GoogleFonts.lexend(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      ),
    );
  }
}
