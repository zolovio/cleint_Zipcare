import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/job_detail/timesheet/timesheet_tabs/timesheet_detail/timesheet_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TimesheetDetailScreen extends ConsumerWidget {
  const TimesheetDetailScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timesheetController = ref.watch(timesheetDetailProvider);

    return Scaffold(
      appBar: getAppBar(title, true, context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: AppColors.darkPurpleColor.withOpacity(.2),
                backgroundColor: AppColors.darkPurpleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          timesheetController.timesheetDetails["date"]["title"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: AppColors.mediumSlateColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          timesheetController.timesheetDetails["date"]["date"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          timesheetController.timesheetDetails["time"]["title"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: AppColors.mediumSlateColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          timesheetController.timesheetDetails["time"]["time"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          timesheetController.timesheetDetails["break_time"]["title"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: AppColors.mediumSlateColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          timesheetController.timesheetDetails["break_time"]["time"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          timesheetController.timesheetDetails["hour_type"]["title"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: AppColors.mediumSlateColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          timesheetController.timesheetDetails["hour_type"]["hour"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        timesheetController.timesheetDetails["expense"]["title"],
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        timesheetController.timesheetDetails["expense"]["value"],
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: AppColors.mediumSlateColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        timesheetController.timesheetDetails["cost"]["title"],
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        timesheetController.timesheetDetails["cost"]["value"],
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: AppColors.mediumSlateColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timesheetController.timesheetDetails["description"]["title"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  timesheetController.timesheetDetails["description"]["value"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: AppColors.mediumSlateColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Receipt",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(receipt, width: 50, height: 50),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        downloadText,
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.cyanColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(receipt, width: 50, height: 50),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        downloadText,
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.cyanColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(height: 3, color: AppColors.lighterGreyColor),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  timesheetController.timesheetDetails["sub_total"]["title"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  timesheetController.timesheetDetails["sub_total"]["value"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  timesheetController.timesheetDetails["expenses"]["title"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  timesheetController.timesheetDetails["expenses"]["value"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(height: 3, color: AppColors.lighterGreyColor),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  timesheetController.timesheetDetails["total"]["title"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  timesheetController.timesheetDetails["total"]["value"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () => timesheetController.onApproved(),
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: AppColors.darkPurpleColor.withOpacity(.5),
                  backgroundColor: AppColors.darkPurpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            approveText,
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: AppColors.darkPurpleColor.withOpacity(.5),
                  backgroundColor: AppColors.darkPurpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            rejectText,
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
