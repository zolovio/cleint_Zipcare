import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/jobs/posted_jobs/posted_job_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PostedJobScreen extends ConsumerWidget {
  const PostedJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postedJobController = ref.watch(postedJobProvider);

    return ListView.builder(
      itemCount: postedJobController.postedJobsList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: index == 0
              ? const EdgeInsets.only(top: 10, left: 12.0, right: 12.0, bottom: 5.0)
              : const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 5.0),
          child: InkWell(
            onTap: (){},
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
                      postedJobController.postedJobsList[index]["title"],
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
                                      postedJobController.postedJobsList[index]["location"],
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
                                      postedJobController.postedJobsList[index]["date_time"],
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
                                      postedJobController.postedJobsList[index]["employment"],
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
                                      postedJobController.postedJobsList[index]["hrs"],
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
                        children: postedJobController.postedJobsList[index]["specification"]
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
                              "${postedJobController.postedJobsList[index]["posted_on"]}",
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
                              "${postedJobController.postedJobsList[index]["status"][1]}",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: (postedJobController.postedJobsList[index]["status"][0] == ApplicationStatus.accepting)
                                    ? greenColor
                                    : (postedJobController.postedJobsList[index]["status"][0] == ApplicationStatus.notAccepting)
                                        ? redColor
                                        : cyanColor,
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
