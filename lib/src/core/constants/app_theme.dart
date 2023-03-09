import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:flutter/material.dart';

MaterialColor colorPrimarySwatch = MaterialColor(
  0xFF7968F8,
  <int, Color>{
    50: AppColors.darkPurpleColor.withOpacity(0.1),
    100: AppColors.darkPurpleColor.withOpacity(0.2),
    200: AppColors.darkPurpleColor.withOpacity(0.3),
    300: AppColors.darkPurpleColor.withOpacity(0.4),
    400: AppColors.darkPurpleColor.withOpacity(0.5),
    500: AppColors.darkPurpleColor.withOpacity(0.6),
    600: AppColors.darkPurpleColor.withOpacity(0.7),
    700: AppColors.darkPurpleColor.withOpacity(0.8),
    800: AppColors.darkPurpleColor.withOpacity(0.9),
    900: AppColors.darkPurpleColor,
  },
);

MaterialColor colorGreySwatch = MaterialColor(
  0xFF9C9C9C,
  <int, Color>{
    50: AppColors.greyColor.withOpacity(0.1),
    100: AppColors.greyColor.withOpacity(0.2),
    200: AppColors.greyColor.withOpacity(0.3),
    300: AppColors.greyColor.withOpacity(0.4),
    400: AppColors.greyColor.withOpacity(0.5),
    500: AppColors.greyColor.withOpacity(0.6),
    600: AppColors.greyColor.withOpacity(0.7),
    700: AppColors.greyColor.withOpacity(0.8),
    800: AppColors.greyColor.withOpacity(0.9),
    900: AppColors.greyColor,
  },
);

final ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: colorPrimarySwatch)
        .copyWith(background: AppColors.lightWhiteColor));
