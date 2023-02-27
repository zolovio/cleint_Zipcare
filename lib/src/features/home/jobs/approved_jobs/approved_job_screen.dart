import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/jobs/approved_jobs/approved_job_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ApprovedJobScreen extends ConsumerWidget {
  const ApprovedJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final approvedJobController = ref.watch(approvedJobProvider);

    return ListView.builder(
      itemCount: approvedJobController.approvedJobsList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: index == 0
              ? const EdgeInsets.only(top: 10, left: 12.0, right: 12.0, bottom: 5.0)
              : const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 5.0),
          child: InkWell(
            onTap: approvedJobController.approvedJobsList[index]["status"][1] == "Active Job" ? () => approvedJobController.onActiveJob() : null,
            child: Card(
              elevation: 5,
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      approvedJobController.approvedJobsList[index]["title"],
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(location, width: 20, height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      approvedJobController.approvedJobsList[index]["location"],
                                      style: GoogleFonts.lexend(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: locationColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Image.asset(calender, width: 20, height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      approvedJobController.approvedJobsList[index]["date_time"],
                                      style: GoogleFonts.lexend(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: locationColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(user, width: 20, height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      approvedJobController.approvedJobsList[index]["employment"],
                                      style: GoogleFonts.lexend(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: locationColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Image.asset(clock, width: 20, height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      approvedJobController.approvedJobsList[index]["hrs"],
                                      style: GoogleFonts.lexend(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: locationColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Wrap(
                        children: approvedJobController.approvedJobsList[index]["specification"]
                            .map<Widget>(
                              (expert) => Container(
                                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                                decoration: const BoxDecoration(
                                  color: shadowColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child: Text(
                                  expert,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "${approvedJobController.approvedJobsList[index]["posted_on"]}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: locationColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${approvedJobController.approvedJobsList[index]["status"][1]}",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: (approvedJobController.approvedJobsList[index]["status"][0] == JobStatus.active)
                                    ? greenColor
                                    : (approvedJobController.approvedJobsList[index]["status"][0] == JobStatus.completed)
                                        ? lightGreyColor
                                        : locationColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
