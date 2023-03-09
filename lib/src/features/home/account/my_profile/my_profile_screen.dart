import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/account/my_profile/my_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myProfileController = ref.watch(myProfileProvider);

    return Scaffold(
      appBar: getAppBar(context, myProfileText, true, true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        editText,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkPurpleColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: circularBorder / 2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: AppColors.avatarColor.withOpacity(0.45),
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0, bottom: 35.0),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: circularBorder / 2),
                                    Text(
                                      myProfileController.username,
                                      style: GoogleFonts.lexend(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.darkPurpleColor,
                                      ),
                                    ),
                                    Text(
                                      myProfileController.email,
                                      style: GoogleFonts.lexend(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.mediumSlateColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightWhiteColor,
                            ),
                            child: Container(
                              width: circularBorder,
                              height: circularBorder,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.avatarColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Text(
                                    "JW",
                                    style: GoogleFonts.lexend(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: myProfileController.profileDetails
                    .map<Widget>(
                      (detail) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              detail["title"],
                              style: GoogleFonts.lexend(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColors.mediumSlateColor,
                              ),
                            ),
                            Text(
                              detail["value"],
                              style: GoogleFonts.lexend(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
