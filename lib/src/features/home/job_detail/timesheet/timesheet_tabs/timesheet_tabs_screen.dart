import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/features/home/job_detail/timesheet/timesheet_tabs/timesheet_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TimesheetTabsScreen extends ConsumerWidget {
  const TimesheetTabsScreen({Key? key, required this.status}) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(timesheetTabProvider);

    List<Map<String, String>> items =
        tabController.timesheetList.where((element) => element["status"] == status).toList();

    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => tabController.onTimesheetTap(items[index]["name"]!),
            child: Card(
              elevation: 4,
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: avatarColor,
                            ),
                            child: const Icon(Icons.line_style_sharp),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  items[index]["name"]!,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                                child: Text(
                                  items[index]["date"]!,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: lightGreyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  items[index]["amount"]!,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: items[index]["status"] == "Approved"
                                        ? deepGreenColor
                                        : items[index]["status"] == "Pending"
                                            ? blueColor
                                            : redColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    items[index]["status"]!,
                                    maxLines: 2,
                                    style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: items[index]["status"] == "Approved"
                                          ? deepGreenColor
                                          : items[index]["status"] == "Pending"
                                              ? blueColor
                                              : redColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
