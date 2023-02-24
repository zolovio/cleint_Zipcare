import 'package:flutter/material.dart';

const MaterialColor colorPrimarySwatch = MaterialColor(
  0xFF7968F8,
  <int, Color>{
    50: Color(0xFF7968F8),
    100: Color(0xFF7968F8),
    200: Color(0xFF7968F8),
    300: Color(0xFF7968F8),
    400: Color(0xFF7968F8),
    500: Color(0xFF7968F8),
    600: Color(0xFF7968F8),
    700: Color(0xFF7968F8),
    800: Color(0xFF7968F8),
    900: Color(0xFF7968F8),
  },
);

const MaterialColor colorGreySwatch = MaterialColor(
  0xFF9C9C9C,
  <int, Color>{
    50: Color(0xFF9C9C9C),
    100: Color(0xFF9C9C9C),
    200: Color(0xFF9C9C9C),
    300: Color(0xFF9C9C9C),
    400: Color(0xFF9C9C9C),
    500: Color(0xFF9C9C9C),
    600: Color(0xFF9C9C9C),
    700: Color(0xFF9C9C9C),
    800: Color(0xFF9C9C9C),
    900: Color(0xFF9C9C9C),
  },
);

const Color primaryColor = Color(0xFF7968F8);
const Color gradientShade = Color(0xFF9165F8);
const Color purpleColor = Color(0xFF7269F8);
const Color whiteColor = Color(0xFFFFFFFF);
const Color blackColor = Color(0xFF000000);
const Color deepBlackColor = Color(0xFF020202);
const Color descGreyColor = Color(0xFF514F4F);
const Color lightWhiteColor = Color(0xFFF8F8F8);
const Color lightGreyColor = Color(0xFF9C9C9C);
const Color darkGreyColor = Color(0xFF3A3A3A);
const Color fieldBorderColor = Color(0xFF89919E);
const Color hintColor = Color(0xFF788190);
const Color hintLightColor = Color(0xFFCFCFCF);
const Color underlineColor = Color(0xFF606060);
const Color rememberMeColor = Color(0xFF52555B);
const Color ratingColor = Color(0xFFFDB614);
const Color greenColor = Color(0xFF30B700);
const Color deepGreenColor = Color(0xFF34A853);
const Color shadowColor = Color(0xFFEAE8FF);
const Color avatarColor = Color(0xFFE0DEFE);
const Color locationColor = Color(0xFFADB2B8);
const Color errorColor = Color(0xFFFF9090);
const Color cyanColor = Color(0xFF32CEFF);
const Color redColor = Color(0xFFFF3232);

final ThemeData themeData = ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch: colorPrimarySwatch).copyWith(background: lightWhiteColor));
