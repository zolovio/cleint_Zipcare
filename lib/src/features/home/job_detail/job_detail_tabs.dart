import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDetailTabs extends ConsumerWidget {
  const JobDetailTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobsTabController = ref.watch(jobDetailTabProvider);

    return Scaffold(
      appBar: getAppBar(
          jobsTabController.selectedIndex == 1
              ? applicantsText
              : jobsTabController.selectedIndex == 2
                  ? allocatedText
                  : jobDetail,
          true,
          context),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              backgroundColor: AppColors.lightWhiteColor,
              elevation: 0,
              bottom: TabBar(
                unselectedLabelColor: AppColors.greyColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0), color: AppColors.darkPurpleColor),
                onTap: (int index) => jobsTabController.onSelectedIndex(index),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: jobsTabController.selectedIndex == 0
                                  ? AppColors.darkPurpleColor
                                  : AppColors.greyColor,
                              width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          jobDetail,
                          style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: jobsTabController.selectedIndex == 1
                                  ? AppColors.darkPurpleColor
                                  : AppColors.greyColor,
                              width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          applicantsText,
                          style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: jobsTabController.selectedIndex == 2
                                  ? AppColors.darkPurpleColor
                                  : AppColors.greyColor,
                              width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          allocatedText,
                          style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: jobsTabController.pages,
          ),
        ),
      ),
    );
  }
}
