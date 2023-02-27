import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/job_detail/allocated/allocated_profile/allocated_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AllocatedProfile extends ConsumerWidget {
  const AllocatedProfile({Key? key, required this.isApproved}) : super(key: key);

  final bool isApproved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileController = ref.watch(allocatedProfileProvider);

    return Scaffold(
      appBar: getAppBar(isApproved ? jobDetail : allocatedText, true, context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            if (isApproved) ...[
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15),
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
                              color: avatarColor.withOpacity(0.45),
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
                                      color: primaryColor,
                                    ),
                                  ),
                                  Text(
                                    profileController.applicantProfile["job_id"],
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
                                      children: profileController.applicantProfile["verified"]
                                          .map<Widget>(
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
                            color: whiteColor,
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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      profileController.applicantProfile["status"]["title"],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Text(
                    " : ",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      profileController.applicantProfile["status"]["value"],
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: blueColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      profileController.applicantProfile["payroll"]["title"],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Text(
                    " : ",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      profileController.applicantProfile["payroll"]["value"],
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: blueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 20),
            Text(
              descriptionText,
              style: GoogleFonts.lexend(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(height: 3, color: hintLightColor),
            const SizedBox(height: 15),
            Text(
              profileController.applicantProfile["services"]["title"],
              style: GoogleFonts.lexend(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: hintColor,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 5,
              children: profileController.applicantProfile["services"]["values"]
                  .map<Widget>(
                    (training) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: shadowColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        training,
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: descGreyColor,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Text(
              profileController.applicantProfile["conditions"]["title"],
              style: GoogleFonts.lexend(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: hintColor,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 5,
              children: profileController.applicantProfile["conditions"]["values"]
                  .map<Widget>(
                    (training) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: shadowColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        training,
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: descGreyColor,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Text(
              profileController.applicantProfile["language"]["title"],
              style: GoogleFonts.lexend(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: hintColor,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 5,
              children: profileController.applicantProfile["language"]["values"]
                  .map<Widget>(
                    (training) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: shadowColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        training,
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: descGreyColor,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Text(
              profileController.applicantProfile["care_type"]["title"],
              style: GoogleFonts.lexend(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: hintColor,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 5,
              children: profileController.applicantProfile["care_type"]["values"]
                  .map<Widget>(
                    (training) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: shadowColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        training,
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: descGreyColor,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Text(
              profileController.applicantProfile["gender"]["title"],
              style: GoogleFonts.lexend(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: hintColor,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 5,
              children: profileController.applicantProfile["gender"]["values"]
                  .map<Widget>(
                    (training) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: shadowColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        training,
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: descGreyColor,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Text(
              profileController.applicantProfile["things_enjoy"]["title"],
              style: GoogleFonts.lexend(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: hintColor,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 5,
              children: profileController.applicantProfile["things_enjoy"]["values"]
                  .map<Widget>(
                    (training) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: shadowColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        training,
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: descGreyColor,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Text(
              profileController.applicantProfile["document"]["title"],
              style: GoogleFonts.lexend(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: hintColor,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(logo, width: 50, height: 50),
                Text(
                  profileController.applicantProfile["document"]["download"],
                  style: GoogleFonts.lexend(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: cyanColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 3, color: hintLightColor),
            const SizedBox(height: 10),
            Text(
              profileController.applicantProfile["requirements"]["title"],
              maxLines: profileController.maxLines,
              overflow: profileController.isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
              style: GoogleFonts.lexend(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: hintColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profileController.applicantProfile["requirements"]["text"],
                    maxLines: profileController.maxLines,
                    overflow: profileController.isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
                    style: GoogleFonts.lexend(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: hintColor,
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
                          color: descGreyColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(height: 3, color: hintLightColor),
            const SizedBox(height: 15),
            const SizedBox(height: 35),
            isApproved
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: primaryColor.withOpacity(.5),
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                            child: Center(
                              child: Text(
                                generateContractText,
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: primaryColor.withOpacity(.5),
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                            child: Center(
                              child: Text(
                                timesheetText,
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: primaryColor.withOpacity(.5),
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                            child: Center(
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
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: primaryColor.withOpacity(.5),
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                            child: Center(
                              child: Text(
                                endEmpText,
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
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
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      removeText,
                                      style: GoogleFonts.lexend(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(remove),
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
  }
}
