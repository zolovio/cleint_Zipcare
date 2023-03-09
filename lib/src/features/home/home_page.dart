// ignore_for_file: must_be_immutable

import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/core/constants/dimensions.dart';
import 'package:client_zipcare/src/features/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.watch(homeProvider);

    return Scaffold(
      appBar: homeController.currentIndex < 2
          ? homeAppBar(context)
          : getAppBar(
              context,
              homeController.currentIndex == 3 ? accountText : chatText,
              true,
              true,
            ),
      body: homeController.pages[homeController.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.darkPurpleColor,
        unselectedItemColor: AppColors.blackColor,
        showUnselectedLabels: true,
        currentIndex: homeController.currentIndex,
        onTap: homeController.onTapped,
        selectedLabelStyle: GoogleFonts.lexend(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: AppColors.darkPurpleColor,
        ),
        unselectedLabelStyle: GoogleFonts.lexend(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: AppColors.blackColor,
        ),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: AppColors.lightWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(home, height: height_25),
              ),
            ),
            activeIcon: CircleAvatar(
              backgroundColor: AppColors.shadowColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(home, height: height_25),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: AppColors.lightWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(jobs, height: height_25),
              ),
            ),
            activeIcon: CircleAvatar(
              backgroundColor: AppColors.shadowColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(jobs, height: height_25),
              ),
            ),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: AppColors.lightWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(chat, height: height_45),
              ),
            ),
            activeIcon: CircleAvatar(
              backgroundColor: AppColors.shadowColor,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(chat, height: height_45),
              ),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: AppColors.lightWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(account, height: height_25),
              ),
            ),
            activeIcon: CircleAvatar(
              backgroundColor: AppColors.shadowColor,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(account, height: height_25),
              ),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
