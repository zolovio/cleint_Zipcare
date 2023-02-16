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
          ? CustomWidgets().homeAppBar(context)
          : CustomWidgets().getAppBar(
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: CircleAvatar(
              backgroundColor: shadowColor,
              child: Icon(Icons.home_outlined),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_outlined),
            activeIcon: CircleAvatar(
              backgroundColor: shadowColor,
              child: Icon(Icons.cases_outlined),
            ),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: CircleAvatar(
              backgroundColor: shadowColor,
              child: Icon(Icons.chat_bubble_outline),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: CircleAvatar(
              backgroundColor: shadowColor,
              child: Icon(Icons.person_outline),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
