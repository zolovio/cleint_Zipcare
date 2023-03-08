import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar getAppBar(String title, bool showAction, BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: true,
    backgroundColor: AppColors.lightWhiteColor,
    iconTheme: const IconThemeData(color: AppColors.blackColor),
    leading:
        IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
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
            title: ElevatedButton(
              onPressed: () => navigatorKey.currentState?.pushNamed(AppRouter.jobPostScreen),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkPurpleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                postAJobText,
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: AppColors.whiteColor,
                ),
              ),
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
