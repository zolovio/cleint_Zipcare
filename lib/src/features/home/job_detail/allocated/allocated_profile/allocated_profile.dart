import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/job_detail/allocated/allocated_profile/allocated_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
                child: Text(
                  profileController.applicantProfile["detail"],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexend(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
              ),
            ],
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
            if (isApproved) ...[
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
                    overflow:
                        profileController.isReadMore ? TextOverflow.visible : TextOverflow.ellipsis,
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
                          onPressed: () => profileController.onGenerateContract(),
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
                          onPressed: () => profileController.onTimeSheetNav(),
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
                          onPressed: () => profileController.onInvoiceTap(),
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
                          onPressed: () => showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.zero,
                                title: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '"Please note that we need at least 2 weeks of notice before the end date."',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            getQuestionsWidget("Are you sure?", false, "", false),
                                            FormBuilderRadioGroup<String>(
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              initialValue: profileController.yesNo[0],
                                              name: 'yes_no',
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize.shrinkWrap,
                                              wrapSpacing: MediaQuery.of(context).size.width * 0.2,
                                              decoration: const InputDecoration(
                                                isDense: true,
                                                contentPadding: EdgeInsets.only(top: 10),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              validator: FormBuilderValidators.compose(
                                                  [FormBuilderValidators.required()]),
                                              options: profileController.yesNo
                                                  .map(
                                                    (val) => FormBuilderFieldOption(
                                                      value: val,
                                                      child: Text(
                                                        val,
                                                        style: GoogleFonts.lexend(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  .toList(growable: false),
                                              controlAffinity: ControlAffinity.leading,
                                            ),
                                            FormBuilderTextField(
                                              name: 'notice_date',
                                              controller: profileController.noticePeriodController,
                                              decoration: InputDecoration(
                                                labelText: "Select a date 2 weeks from now",
                                                labelStyle: GoogleFonts.lexend(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                suffixIcon: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child:
                                                      Image.asset(calender, width: 10, height: 10),
                                                ),
                                                border: const OutlineInputBorder(
                                                  borderSide:
                                                      BorderSide(width: 1, color: hintLightColor),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(textFieldBorderRadius)),
                                                ),
                                              ),
                                              validator: FormBuilderValidators.compose(
                                                  [FormBuilderValidators.required()]),
                                              readOnly: true,
                                              onTap: () async {
                                                DateTime? pickedDate = await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2000),
                                                    lastDate: DateTime(3000));

                                                if (pickedDate != null) {
                                                  String formattedDate =
                                                      DateFormat('dd-MMM-yyyy').format(pickedDate);

                                                  profileController.noticePeriodController.text =
                                                      formattedDate;
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () => navigatorKey.currentState?.pop(),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 35.0),
                                          child: Center(
                                            child: Text(
                                              submitText,
                                              style: GoogleFonts.lexend(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                                color: whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                ],
                              );
                            },
                          ),
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
