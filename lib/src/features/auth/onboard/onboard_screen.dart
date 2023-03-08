// ignore_for_file: camel_case_types, must_be_immutable

import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/core/constants/dimensions.dart';
import 'package:client_zipcare/src/features/auth/onboard/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardScreen extends ConsumerWidget {
  OnBoardScreen({Key? key}) : super(key: key);

  int pageCount = 4;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;

    final onboardController = ref.watch(onBoardProvider);

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: AppColors.lightPurpleColor,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.lightPurpleColor,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.lightPurpleColor,
                  AppColors.darkPurpleColor,
                  AppColors.lightPurpleColor,
                  AppColors.darkPurpleColor,
                  AppColors.lightPurpleColor,
                  AppColors.darkPurpleColor,
                ],
              )),
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: elvation_5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(margin_40))),
                    child: Container(
                      height: size.height * 0.8,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(height_40)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: PageView.builder(
                                controller: onboardController.pageController,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount: onboardController.selectData.length,
                                onPageChanged: (page) {
                                  onboardController.onPageChanged(page);
                                },
                                itemBuilder: (context, index) {
                                  return _pagesContainer(
                                      index, MediaQuery.of(context).size, onboardController);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: margin_14,
                            child: ListView.builder(
                                itemCount: onboardController.selectData.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      padding: const EdgeInsets.all(20),
                                      margin: const EdgeInsets.all(2),
                                      height: margin_10,
                                      width: margin_10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: onboardController.selectedIndex == index
                                            ? AppColors.darkPurpleColor
                                            : AppColors.lighterGreyColor,
                                      ));
                                }),
                          ),
                          SizedBox(height: height_30)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _skipButton(onboardController.selectedIndex, context, onboardController),
            )
          ],
        ),
      ),
    );
  }
}

_pagesContainer(index, Size size, OnBoardController vm) {
  return Container(
    width: size.width,
    margin: EdgeInsets.only(top: height_15, bottom: height_30, left: height_20, right: height_20),
    padding: EdgeInsets.only(top: height_50, bottom: height_30),
    color: AppColors.whiteColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: height_20),
        _title(index, vm),
        SizedBox(height: height_20),
        _description(index, vm),
        Expanded(child: _image(index, vm))
      ],
    ),
  );
}

_title(index, OnBoardController vm) {
  return Text(
    vm.selectData[index].title,
    style: GoogleFonts.lexend(
      color: Colors.black,
      fontSize: font_25,
    ),
    textAlign: TextAlign.center,
  );
}

_description(index, OnBoardController vm) {
  return Text(
    '${vm.selectData[index].desc}',
    style: GoogleFonts.lexend(color: AppColors.deepGreyColor, fontSize: font_15),
    textAlign: TextAlign.center,
  );
}

_image(index, OnBoardController vm) {
  return Image.asset(
    '${vm.selectData[index].image}',
    height: height_80,
  );
}

_skipButton(int index, context, OnBoardController vm) {
  return Container(
    alignment: Alignment.center,
    height: height_45,
    width: width_130,
    decoration:
        BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(height_10)),
    margin: EdgeInsets.symmetric(vertical: margin_20),
    child: ElevatedButton(
      onPressed: () {
        if (index == 3) {
          vm.onGetStarted();
        } else {
          vm.pageController.jumpToPage(index + 1);
        }
      },
      style: ElevatedButton.styleFrom(
        elevation: elvation_4,
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Center(
        child: Text(
          index == 3 ? getStartedText : skipText,
          style: GoogleFonts.lexend(
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
            fontSize: font_14,
          ),
        ),
      ),
    ),
  );
}
