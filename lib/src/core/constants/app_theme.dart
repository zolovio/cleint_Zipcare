import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:flutter/material.dart';

const MaterialColor colorPrimarySwatch = MaterialColor(
  0xFF7968F8,
  <int, Color>{
    50: AppColors.darkPurpleColor,
    100: AppColors.darkPurpleColor,
    200: AppColors.darkPurpleColor,
    300: AppColors.darkPurpleColor,
    400: AppColors.darkPurpleColor,
    500: AppColors.darkPurpleColor,
    600: AppColors.darkPurpleColor,
    700: AppColors.darkPurpleColor,
    800: AppColors.darkPurpleColor,
    900: AppColors.darkPurpleColor,
  },
);

const MaterialColor colorGreySwatch = MaterialColor(
  0xFF9C9C9C,
  <int, Color>{
    50: AppColors.greyColor,
    100: AppColors.greyColor,
    200: AppColors.greyColor,
    300: AppColors.greyColor,
    400: AppColors.greyColor,
    500: AppColors.greyColor,
    600: AppColors.greyColor,
    700: AppColors.greyColor,
    800: AppColors.greyColor,
    900: AppColors.greyColor,
  },
);

final ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: colorPrimarySwatch)
        .copyWith(background: AppColors.lightWhiteColor));
