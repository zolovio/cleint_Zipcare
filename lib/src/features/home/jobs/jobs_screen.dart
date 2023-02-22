import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/jobs/approved_jobs/approved_job_screen.dart';
import 'package:client_zipcare/src/features/home/jobs/jobs_controller.dart';
import 'package:client_zipcare/src/features/home/jobs/posted_jobs/posted_job_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobsScreen extends ConsumerWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobsController = ref.watch(jobsProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              unselectedLabelColor: lightGreyColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: primaryColor),
              onTap: (int index) => jobsController.onSelectedIndex(index),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: jobsController.selectedIndex == 0 ? primaryColor : lightGreyColor, width: 1)),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(postedText),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: jobsController.selectedIndex == 1 ? primaryColor : lightGreyColor, width: 1)),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(approvedText),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            PostedJobScreen(),
            ApprovedJobScreen(),
          ],
        ),
      ),
    );
  }
}
