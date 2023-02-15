// ignore_for_file: must_be_immutable

import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.watch(homeProvider);

    return Scaffold(
      appBar: homeController.currentIndex == 0
          ? PreferredSize(
              preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.255),
              child: Container(
                padding: const EdgeInsets.only(top: 15.0),
                color: whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      elevation: 0,
                      centerTitle: true,
                      backgroundColor: whiteColor,
                      leading: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          logo,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // <-- Radius
                          ),
                        ),
                        child: Text(
                          postAJobText,
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: whiteColor,
                          ),
                        ),
                      ),
                      actions: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.notifications_none,
                            color: blackColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
                        child: FormBuilderTextField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          name: 'search',
                          decoration: InputDecoration(
                            hintText: 'Search for carers',
                            hintStyle: GoogleFonts.lexend(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: hintLightColor,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: const Icon(Icons.search, color: hintColor),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: greyColor),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          onChanged: (val) {},
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              backgroundColor: whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              filterText,
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          availableCarerText,
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : null,
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
