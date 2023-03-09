import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/components/custom_button.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/core/constants/dimensions.dart';
import 'package:client_zipcare/src/core/constants/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar getAppBar(
  BuildContext context,
  String title,
  bool implyLeading,
  bool showAction,
) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: implyLeading,
    backgroundColor: AppColors.lightWhiteColor,
    iconTheme: const IconThemeData(color: AppColors.blackColor),
    // leading:
    //     IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
    title: Text(
      title,
      style: GoogleFonts.lexend(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.blackColor,
      ),
    ),
    actions: [
      if (showAction)
        InkWell(
          onTap: () => navigatorKey.currentState?.pushNamed(AppRouter.notification),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(child: Image.asset(notification)),
          ),
        ),
    ],
  );
}

AppBar getSimpleAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: true,
    backgroundColor: AppColors.lightWhiteColor,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.keyboard_backspace),
      color: AppColors.blackColor,
      onPressed: () => Navigator.pop(context),
    ),
  );
}

PreferredSize homeAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
    child: Container(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: AppColors.lightWhiteColor,
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                logo,
                fit: BoxFit.cover,
              ),
            ),
            title: CustomButton(
              onPressed: () => navigatorKey.currentState?.pushNamed(AppRouter.jobPostScreen),
              title: postAJobText,
              fontWeight: fontWeight400,
              fontSize: font_15,
              textColors: AppColors.whiteColor,
              radius: radius_5,
              buttonColors: AppColors.darkPurpleColor,
              buttonHeight: height_35,
              buttonWidth: width_120,
              icon: null,
            ),
            actions: [
              InkWell(
                onTap: () => navigatorKey.currentState?.pushNamed(AppRouter.notification),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(child: Image.asset(notification)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
