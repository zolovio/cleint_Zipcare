// ignore_for_file: must_be_immutable

import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
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
      appBar: homeController.currentIndex == 0
          ? homeAppBar(context)
          : getAppBar(
              chatText,
              true,
              context,
            ),
      body: homeController.pages[homeController.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: blackColor,
        showUnselectedLabels: true,
        currentIndex: homeController.currentIndex,
        onTap: homeController.onTapped,
        selectedLabelStyle: GoogleFonts.lexend(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: primaryColor,
        ),
        unselectedLabelStyle: GoogleFonts.lexend(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: blackColor,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(home, width: 25),
            activeIcon: CircleAvatar(
              backgroundColor: shadowColor,
              child: Image.asset(home, width: 25),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(jobs, width: 25),
            activeIcon: CircleAvatar(
              backgroundColor: shadowColor,
              child: Image.asset(jobs, width: 25),
            ),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(chat, width: 40),
            activeIcon: CircleAvatar(
              backgroundColor: shadowColor,
              child: Image.asset(chat, width: 40),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(account, width: 30),
            activeIcon: CircleAvatar(
              backgroundColor: shadowColor,
              child: Image.asset(account, width: 30),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
