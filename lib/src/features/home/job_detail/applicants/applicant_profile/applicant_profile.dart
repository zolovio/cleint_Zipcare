import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/job_detail/applicants/applicant_profile/applicant_profile_controller.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class ApplicantProfile extends ConsumerStatefulWidget {
  const ApplicantProfile({Key? key}) : super(key: key);

  @override
  ConsumerState<ApplicantProfile> createState() => _ApplicantsProfileState();
}

class _ApplicantsProfileState extends ConsumerState<ApplicantProfile> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();

    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network("https://www.youtube.com/watch?v=C0DPdy98e4c"),
    );
  }

  @override
  void dispose() {
    super.dispose();
    flickManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final profileController = ref.watch(applicantProfileProvider);

      return Scaffold(
        appBar: getAppBar(applicantsText, true, context),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Text(
                profileController.applicantProfile["job_title"],
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: SizedBox(
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
                                color: AppColors.avatarColor.withOpacity(0.45),
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: circularBorder / 2),
                                    Text(
                                      profileController.applicantProfile["name"],
                                      style: GoogleFonts.lexend(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.darkPurpleColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      profileController.applicantProfile["email"],
                                      style: GoogleFonts.lexend(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.mediumSlateColor,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: profileController.applicantProfile["verified"]
                                            .map<Widget>(
                                              (verify) => Column(
                                                children: [
                                                  Image.asset(verify[0], width: 20, height: 20),
                                                  const SizedBox(height: 5),
                                                  if (verify[0] == rating) ...[
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${verify[1].toString().split(" ")[0]} ",
                                                          style: GoogleFonts.lexend(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w500,
                                                            color: AppColors.blackColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          verify[1].toString().split(" ")[1],
                                                          style: GoogleFonts.lexend(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.w400,
                                                            color: AppColors.mediumSlateColor,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ] else ...[
                                                    Row(
                                                      children: [
                                                        Text(
                                                          verify[1],
                                                          style: GoogleFonts.lexend(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.w400,
                                                            color: AppColors.mediumSlateColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.whiteColor,
                            ),
                            child: SizedBox(
                              width: circularBorder,
                              height: circularBorder,
                              child: Center(
                                child: Image.asset(
                                  profileController.applicantProfile["profile_img"],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                profileController.applicantProfile["rates"]["title"],
                style: GoogleFonts.lexend(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGreyColor,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: profileController.applicantProfile["rates"]["values"]
                    .map<Widget>(
                      (rate) => Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                rate["title"],
                                style: GoogleFonts.lexend(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyColor,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Wrap(
                                spacing: MediaQuery.of(context).size.width * 0.1,
                                children: rate["values"]
                                    .map<Widget>(
                                      (rates) => Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            rates["price"],
                                            style: GoogleFonts.lexend(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          if (rates["title"] != "whole") ...[
                                            Text(
                                              rates["title"],
                                              style: GoogleFonts.lexend(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.greyColor,
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 10),
              const Divider(height: 3, color: AppColors.lighterGreyColor),
              const SizedBox(height: 15),
              Text(
                profileController.applicantProfile["about"]["title"],
                maxLines: profileController.maxLines,
                overflow:
                    profileController.isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
                style: GoogleFonts.lexend(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mediumSlateColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profileController.applicantProfile["about"]["text"],
                      maxLines: profileController.maxLines,
                      overflow: profileController.isReadMore
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      style: GoogleFonts.lexend(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mediumSlateColor,
                      ),
                    ),
                    InkWell(
                      onTap: () => profileController.onReadMoreText(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          profileController.isReadMore ? 'Read Less' : 'Read More',
                          style: GoogleFonts.lexend(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkPurpleColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(height: 3, color: AppColors.lighterGreyColor),
              const SizedBox(height: 15),
              Text(
                profileController.applicantProfile["video"]["title"],
                maxLines: profileController.maxLines,
                overflow:
                    profileController.isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
                style: GoogleFonts.lexend(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mediumSlateColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: FlickVideoPlayer(flickManager: flickManager),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(height: 3, color: AppColors.lighterGreyColor),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: profileController.applicantProfile["address"]
                    .map<Widget>(
                      (address) => Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                address["title"],
                                style: GoogleFonts.lexend(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.mediumSlateColor,
                                ),
                              ),
                            ),
                            Text(
                              address["name"],
                              style: GoogleFonts.lexend(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 10),
              const Divider(height: 3, color: AppColors.lighterGreyColor),
              const SizedBox(height: 10),
              Text(
                profileController.applicantProfile["services"]["title"],
                style: GoogleFonts.lexend(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mediumSlateColor,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: profileController.applicantProfile["services"]["values"]
                    .map<Widget>(
                      (service) => Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                service["title"],
                                style: GoogleFonts.lexend(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: AppColors.darkPurpleColor),
                                child: Text(
                                  service["value"],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lexend(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 10),
              const Divider(height: 3, color: AppColors.lighterGreyColor),
              const SizedBox(height: 10),
              Text(
                profileController.applicantProfile["training"]["title"],
                style: GoogleFonts.lexend(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mediumSlateColor,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 5,
                children: profileController.applicantProfile["training"]["values"]
                    .map<Widget>(
                      (training) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.shadowColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          training,
                          style: GoogleFonts.lexend(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 10),
              const Divider(height: 3, color: AppColors.lighterGreyColor),
              const SizedBox(height: 10),
              Text(
                profileController.applicantProfile["health_condition"]["title"],
                style: GoogleFonts.lexend(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mediumSlateColor,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: profileController.applicantProfile["health_condition"]["values"]
                    .map<Widget>(
                      (service) => Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                service["title"],
                                style: GoogleFonts.lexend(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: AppColors.darkPurpleColor),
                                child: Text(
                                  service["value"],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lexend(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 10),
              const Divider(height: 3, color: AppColors.lighterGreyColor),
              const SizedBox(height: 10),
              Text(
                profileController.applicantProfile["enjoy"]["title"],
                style: GoogleFonts.lexend(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mediumSlateColor,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 5,
                children: profileController.applicantProfile["enjoy"]["values"]
                    .map<Widget>(
                      (training) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.shadowColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          training,
                          style: GoogleFonts.lexend(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 10),
              const Divider(height: 3, color: AppColors.lighterGreyColor),
              const SizedBox(height: 10),
              Text(
                profileController.applicantProfile["soft_skill"]["title"],
                style: GoogleFonts.lexend(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mediumSlateColor,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 5,
                children: profileController.applicantProfile["soft_skill"]["values"]
                    .map<Widget>(
                      (training) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.shadowColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          training,
                          style: GoogleFonts.lexend(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 10),
              const Divider(height: 3, color: AppColors.lighterGreyColor),
              const SizedBox(height: 10),
              Text(
                profileController.applicantProfile["qualification"]["title"],
                style: GoogleFonts.lexend(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mediumSlateColor,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 5,
                children: profileController.applicantProfile["qualification"]["values"]
                    .map<Widget>(
                      (training) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.shadowColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          training,
                          style: GoogleFonts.lexend(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 10),
              const Divider(height: 3, color: AppColors.lighterGreyColor),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        profileController.applicantProfile["experience"]["title"],
                        style: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mediumSlateColor,
                        ),
                      ),
                    ),
                    Text(
                      profileController.applicantProfile["experience"]["value"],
                      style: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
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
                                  messageText,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(messageSend),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
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
                                  shortlistText,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(shortlist),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
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
                            Image.asset(approve),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
