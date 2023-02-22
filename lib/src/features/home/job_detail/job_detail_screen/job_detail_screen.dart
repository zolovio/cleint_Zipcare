import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_screen/job_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDetailScreen extends ConsumerWidget {
  const JobDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobDetailController = ref.watch(jobDetailProvider);

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 28.0, bottom: 15),
          child: Text(
            jobDetailController.jobDetail[0]["title"],
            textAlign: TextAlign.center,
            style: GoogleFonts.lexend(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: blackColor,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 15.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: circularBorder / 2.0),

                      ///here we create space for the circle avatar to get ut of the box
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: avatarColor.withOpacity(0.45),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: circularBorder / 2),
                              Text(
                                jobDetailController.userName,
                                style: GoogleFonts.lexend(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                ),
                              ),
                              Text(
                                jobDetailController.jobId,
                                style: GoogleFonts.lexend(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: hintColor,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: jobDetailController.profileUserDetails
                                      .map(
                                        (e) => Column(
                                          children: [
                                            Image.asset(e[0]),
                                            const SizedBox(height: 5),
                                            Text(
                                              e[1],
                                              style: GoogleFonts.lexend(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: hintColor,
                                              ),
                                            ),
                                            Text(
                                              e[2],
                                              style: GoogleFonts.lexend(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: hintColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///Image Avatar
                    Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Container(
                        width: circularBorder,
                        height: circularBorder,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: avatarColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: Text(
                              "JW",
                              style: GoogleFonts.lexend(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Divider(height: 3, color: hintLightColor),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: [
                  Text(
                    jobStatusText,
                    style: GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    " : ",
                    style: GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    acceptingApplicationText,
                    style: GoogleFonts.lexend(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: greenColor,
                    ),
                  ),
                ],
              ),
              CupertinoSwitch(
                activeColor: greenColor,
                thumbColor: whiteColor,
                trackColor: Colors.black12,
                value: jobDetailController.switchApplicationMode,
                onChanged: (value) => jobDetailController.onSwitchApplicationMode(),
              ),
            ],
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.all(18.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Is this a self-employed position?", false, "", false),
        //       Container(
        //         margin: const EdgeInsets.symmetric(vertical: 10),
        //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.rectangle,
        //           color: shadowColor,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(20),
        //           ),
        //         ),
        //         child: Text(
        //           jobPostController.isSelfEmployed ? jobPostController.yesNo[0] : jobPostController.yesNo[1],
        //           style: GoogleFonts.lexend(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w400,
        //             color: descGreyColor,
        //           ),
        //         ),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Is it an urgent requirement/ needs matching?", false, "", false),
        //       Container(
        //         margin: const EdgeInsets.symmetric(vertical: 10),
        //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.rectangle,
        //           color: shadowColor,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(20),
        //           ),
        //         ),
        //         child: Text(
        //           jobPostController.isRequireUrgently ? jobPostController.yesNo[0] : jobPostController.yesNo[1],
        //           style: GoogleFonts.lexend(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w400,
        //             color: descGreyColor,
        //           ),
        //         ),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Is the carer requested for a person or business?", false, "", false),
        //       Container(
        //         margin: const EdgeInsets.symmetric(vertical: 10),
        //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.rectangle,
        //           color: shadowColor,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(20),
        //           ),
        //         ),
        //         child: Text(
        //           jobPostController.isRequireUrgently ? jobPostController.yesNo[0] : jobPostController.yesNo[1],
        //           style: GoogleFonts.lexend(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w400,
        //             color: descGreyColor,
        //           ),
        //         ),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Are you the person needing care", false, "", false),
        //       Container(
        //         margin: const EdgeInsets.symmetric(vertical: 10),
        //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.rectangle,
        //           color: shadowColor,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(20),
        //           ),
        //         ),
        //         child: Text(
        //           jobPostController.isCareNeedFor ? jobPostController.yesNo[0] : jobPostController.yesNo[1],
        //           style: GoogleFonts.lexend(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w400,
        //             color: descGreyColor,
        //           ),
        //         ),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Type of care*", false, "", false),
        //       Container(
        //         margin: const EdgeInsets.symmetric(vertical: 10),
        //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.rectangle,
        //           color: shadowColor,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(20),
        //           ),
        //         ),
        //         child: Text(
        //           jobPostController.isCareType ? jobPostController.careType[0] : jobPostController.yesNo[1],
        //           style: GoogleFonts.lexend(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w400,
        //             color: descGreyColor,
        //           ),
        //         ),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Type of job*", false, "", false),
        //       Container(
        //         margin: const EdgeInsets.symmetric(vertical: 10),
        //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.rectangle,
        //           color: shadowColor,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(20),
        //           ),
        //         ),
        //         child: Text(
        //           jobPostController.isJobType ? jobPostController.jobType[0] : jobPostController.yesNo[1],
        //           style: GoogleFonts.lexend(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w400,
        //             color: descGreyColor,
        //           ),
        //         ),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("When do you require care ?", false, "", false),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Wrap(
        //           alignment: WrapAlignment.spaceBetween,
        //           spacing: 20,
        //           children: [
        //             Wrap(
        //               children: [
        //                 Text(
        //                   "Start Date: ",
        //                   style: GoogleFonts.lexend(
        //                     fontSize: 11,
        //                     fontWeight: FontWeight.w400,
        //                     color: descGreyColor,
        //                   ),
        //                 ),
        //                 Text(
        //                   jobPostController.dateFormat,
        //                   style: GoogleFonts.lexend(
        //                     fontSize: 11,
        //                     fontWeight: FontWeight.w400,
        //                     color: blackColor,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             Wrap(
        //               children: [
        //                 Text(
        //                   "Time: ",
        //                   style: GoogleFonts.lexend(
        //                     fontSize: 11,
        //                     fontWeight: FontWeight.w400,
        //                     color: descGreyColor,
        //                   ),
        //                 ),
        //                 Text(
        //                   jobPostController.timeFormat,
        //                   style: GoogleFonts.lexend(
        //                     fontSize: 11,
        //                     fontWeight: FontWeight.w400,
        //                     color: blackColor,
        //                   ),
        //                 ),
        //                 Text(
        //                   jobPostController.hoursFormat,
        //                   style: GoogleFonts.lexend(
        //                     fontSize: 11,
        //                     fontWeight: FontWeight.w400,
        //                     color: blackColor,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             Wrap(
        //               children: [
        //                 Text(
        //                   "No of hrs/week: ",
        //                   style: GoogleFonts.lexend(
        //                     fontSize: 11,
        //                     fontWeight: FontWeight.w400,
        //                     color: descGreyColor,
        //                   ),
        //                 ),
        //                 Text(
        //                   "${jobPostController.noOfHours}hrs",
        //                   style: GoogleFonts.lexend(
        //                     fontSize: 11,
        //                     fontWeight: FontWeight.w400,
        //                     color: blackColor,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Carer’s Gender", false, "", false),
        //       Container(
        //         margin: const EdgeInsets.symmetric(vertical: 10),
        //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.rectangle,
        //           color: shadowColor,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(20),
        //           ),
        //         ),
        //         child: Text(
        //           jobPostController.gender[1],
        //           style: GoogleFonts.lexend(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w400,
        //             color: descGreyColor,
        //           ),
        //         ),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("You need care for which health conditions.", false, "", false),
        //       Wrap(
        //         spacing: 5,
        //         children: jobPostController.healthConditionsSelected
        //             .map(
        //               (service) => Container(
        //                 margin: const EdgeInsets.symmetric(vertical: 5),
        //                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        //                 decoration: const BoxDecoration(
        //                   shape: BoxShape.rectangle,
        //                   color: shadowColor,
        //                   borderRadius: BorderRadius.all(
        //                     Radius.circular(20),
        //                   ),
        //                 ),
        //                 child: Text(
        //                   service,
        //                   style: GoogleFonts.lexend(
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     color: descGreyColor,
        //                   ),
        //                 ),
        //               ),
        //             )
        //             .toList(),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Services you need from the carer", false, "", false),
        //       Wrap(
        //         spacing: 5,
        //         children: jobPostController.serviceRequiredSelected
        //             .map(
        //               (service) => Container(
        //                 margin: const EdgeInsets.symmetric(vertical: 5),
        //                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        //                 decoration: const BoxDecoration(
        //                   shape: BoxShape.rectangle,
        //                   color: shadowColor,
        //                   borderRadius: BorderRadius.all(
        //                     Radius.circular(20),
        //                   ),
        //                 ),
        //                 child: Text(
        //                   service,
        //                   style: GoogleFonts.lexend(
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w400,
        //                     color: descGreyColor,
        //                   ),
        //                 ),
        //               ),
        //             )
        //             .toList(),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Access to funding?", false, "", false),
        //       Container(
        //         margin: const EdgeInsets.symmetric(vertical: 10),
        //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.rectangle,
        //           color: shadowColor,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(20),
        //           ),
        //         ),
        //         child: Text(
        //           jobPostController.yesNo[0],
        //           style: GoogleFonts.lexend(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w400,
        //             color: descGreyColor,
        //           ),
        //         ),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Type of funding", false, "", false),
        //       Container(
        //         margin: const EdgeInsets.symmetric(vertical: 10),
        //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.rectangle,
        //           color: shadowColor,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(20),
        //           ),
        //         ),
        //         child: Text(
        //           jobPostController.listFundingType[1],
        //           style: GoogleFonts.lexend(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w400,
        //             color: descGreyColor,
        //           ),
        //         ),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Care plan Documents", false, "", false),
        //       Container(
        //         margin: const EdgeInsets.symmetric(vertical: 10),
        //         child: Row(
        //           children: [
        //             const CircleAvatar(),
        //             Text(
        //               jobPostController.fileName!,
        //               style: GoogleFonts.lexend(
        //                 fontSize: 12,
        //                 fontWeight: FontWeight.w400,
        //                 color: descGreyColor,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       const Divider(height: 3, color: hintLightColor),
        //       const SizedBox(height: 15),
        //       getQuestionsWidget("Specific Requirements", false, "", false),
        //       Container(
        //         margin: const EdgeInsets.symmetric(vertical: 10),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               jobPostController.requirementsText,
        //               maxLines: jobPostController.maxLines,
        //               overflow: jobPostController.isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
        //               style: GoogleFonts.lexend(
        //                 fontSize: 15,
        //                 fontWeight: FontWeight.w400,
        //                 color: underlineColor,
        //               ),
        //             ),
        //             InkWell(
        //               onTap: () => jobPostController.onReadMoreText(),
        //               child: Padding(
        //                 padding: const EdgeInsets.only(top: 8.0),
        //                 child: Text(
        //                   jobPostController.isReadMore ? 'Read Less' : 'Read More',
        //                   style: GoogleFonts.lexend(
        //                     fontSize: 15,
        //                     fontWeight: FontWeight.w500,
        //                     color: blackColor,
        //                     decoration: TextDecoration.underline,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
