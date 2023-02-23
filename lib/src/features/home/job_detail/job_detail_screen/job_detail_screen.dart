import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
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

    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0, top: 10.0),
      child: ListView(
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
                Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: circularBorder / 2.0),
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
                    Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: lightWhiteColor,
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
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(height: 3, color: hintLightColor),
          const SizedBox(height: 10),
          Row(
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
          const SizedBox(height: 40),
          Column(
            children: jobDetailController.jobDetail[0]["details"]
                .map<Widget>(
                  (detail) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getQuestionsWidget(detail["ques"], false, "", false),
                      detail["bg"]
                          ? Wrap(
                              spacing: 5,
                              children: detail["ans"]
                                  .map<Widget>((ans) => Container(
                                        margin: const EdgeInsets.symmetric(vertical: 10),
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: shadowColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        child: Text(
                                          ans,
                                          style: GoogleFonts.lexend(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: descGreyColor,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 20,
                                children: [
                                  Wrap(
                                    children: [
                                      Text(
                                        "Start Date: ",
                                        style: GoogleFonts.lexend(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: descGreyColor,
                                        ),
                                      ),
                                      Text(
                                        detail["ans"][0],
                                        style: GoogleFonts.lexend(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    children: [
                                      Text(
                                        "Time: ",
                                        style: GoogleFonts.lexend(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: descGreyColor,
                                        ),
                                      ),
                                      Text(
                                        detail["ans"][1],
                                        style: GoogleFonts.lexend(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      const Divider(height: 3, color: hintLightColor),
                      const SizedBox(height: 15),
                    ],
                  ),
                )
                .toList(),
          ),
          const Divider(height: 3, color: hintLightColor),
          const SizedBox(height: 15),
          getQuestionsWidget("Specific Requirements", false, "", false),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobDetailController.requirementsText,
                  maxLines: jobDetailController.maxLines,
                  overflow: jobDetailController.isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
                  style: GoogleFonts.lexend(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: underlineColor,
                  ),
                ),
                InkWell(
                  onTap: () => jobDetailController.onReadMoreText(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      jobDetailController.isReadMore ? 'Read Less' : 'Read More',
                      style: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
              child: Text(
                serviceAgreementText,
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: whiteColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
              child: Text(
                invoiceText,
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: whiteColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
              child: Text(
                jobCompletedText,
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
