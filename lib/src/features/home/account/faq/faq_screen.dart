import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/account/faq/faq_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQScreen extends ConsumerWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faqController = ref.watch(faqProvider);

    return Scaffold(
      appBar: getAppBar(context, faqText, true, true),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          Theme(
            data: ThemeData(dividerColor: Colors.transparent),
            child: ListTileTheme(
              dense: true,
              horizontalTitleGap: 16.0,
              minLeadingWidth: 0,
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                initiallyExpanded: faqController.isExpanded,
                textColor: AppColors.blackColor,
                onExpansionChanged: (bool value) => faqController.onExpand(value),
                title: ListTile(
                  leading: const Icon(
                    Icons.circle_sharp,
                    color: AppColors.darkPurpleColor,
                    size: 18,
                  ),
                  title: Text(
                    'What is a Payment Gateway?',
                    style: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.darkPurpleColor,
                  ),
                ),
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.12),
                    child: Text(
                      faqController.faqDescription,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mediumSlateColor,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Theme(
            data: ThemeData(dividerColor: Colors.transparent),
            child: ListTileTheme(
              dense: true,
              horizontalTitleGap: 10.0,
              minLeadingWidth: 0,
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                initiallyExpanded: faqController.isExpanded,
                textColor: AppColors.blackColor,
                onExpansionChanged: (bool value) => faqController.onExpand(value),
                title: ListTile(
                  leading: const Icon(
                    Icons.circle_sharp,
                    color: AppColors.shadowColor,
                    size: 18,
                  ),
                  title: Text(
                    'Do I need to pay to Instapay even when there is no transaction going on in my business?',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.mediumSlateColor,
                      height: 1.6,
                    ),
                  ),
                ),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: AppColors.darkPurpleColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Theme(
            data: ThemeData(dividerColor: Colors.transparent),
            child: ListTileTheme(
              dense: true,
              horizontalTitleGap: 10.0,
              minLeadingWidth: 0,
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                initiallyExpanded: faqController.isExpanded,
                textColor: AppColors.blackColor,
                onExpansionChanged: (bool value) => faqController.onExpand(value),
                title: ListTile(
                  leading: const Icon(
                    Icons.circle_sharp,
                    color: AppColors.shadowColor,
                    size: 18,
                  ),
                  title: Text(
                    'Do I need to pay to Instapay even when there is no transaction going on in my business?',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.mediumSlateColor,
                      height: 1.6,
                    ),
                  ),
                ),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: AppColors.darkPurpleColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Theme(
            data: ThemeData(dividerColor: Colors.transparent),
            child: ListTileTheme(
              dense: true,
              horizontalTitleGap: 10.0,
              minLeadingWidth: 0,
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                initiallyExpanded: faqController.isExpanded,
                textColor: AppColors.blackColor,
                onExpansionChanged: (bool value) => faqController.onExpand(value),
                title: ListTile(
                  leading: const Icon(
                    Icons.circle_sharp,
                    color: AppColors.shadowColor,
                    size: 18,
                  ),
                  title: Text(
                    'Do I need to pay to Instapay even when there is no transaction going on in my business?',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.mediumSlateColor,
                      height: 1.6,
                    ),
                  ),
                ),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: AppColors.darkPurpleColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Theme(
            data: ThemeData(dividerColor: Colors.transparent),
            child: ListTileTheme(
              dense: true,
              horizontalTitleGap: 10.0,
              minLeadingWidth: 0,
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                initiallyExpanded: faqController.isExpanded,
                textColor: AppColors.blackColor,
                onExpansionChanged: (bool value) => faqController.onExpand(value),
                title: ListTile(
                  leading: const Icon(
                    Icons.circle_sharp,
                    color: AppColors.shadowColor,
                    size: 18,
                  ),
                  title: Text(
                    'Do I need to pay to Instapay even when there is no transaction going on in my business?',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.mediumSlateColor,
                      height: 1.6,
                    ),
                  ),
                ),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: AppColors.darkPurpleColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Theme(
            data: ThemeData(dividerColor: Colors.transparent),
            child: ListTileTheme(
              dense: true,
              horizontalTitleGap: 10.0,
              minLeadingWidth: 0,
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                initiallyExpanded: faqController.isExpanded,
                textColor: AppColors.blackColor,
                onExpansionChanged: (bool value) => faqController.onExpand(value),
                title: ListTile(
                  leading: const Icon(
                    Icons.circle_sharp,
                    color: AppColors.shadowColor,
                    size: 18,
                  ),
                  title: Text(
                    'Do I need to pay to Instapay even when there is no transaction going on in my business?',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.mediumSlateColor,
                      height: 1.6,
                    ),
                  ),
                ),
                trailing: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: AppColors.darkPurpleColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
