import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/job_post/job_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class JobPostScreen extends ConsumerWidget {
  JobPostScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  TextEditingController dateInput = TextEditingController();
  TextEditingController timeInput = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobPostController = ref.watch(jobPostProvider);

    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppBar(jobPostController.currentIndex == 6 ? jobDetail : jobPost, true, context),
      body: ListView(
        children: [
          if (jobPostController.currentIndex <= 5) getStepperWidget("${jobPostController.currentIndex}", "/${jobPostController.totalIndices}", true),
          FormBuilder(
            key: _formKey,
            onChanged: () {
              _formKey.currentState!.save();
            },
            autovalidateMode: AutovalidateMode.disabled,
            skipDisabled: true,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 15),
                  if (jobPostController.currentIndex == 1) ...[
                    getQuestionsWidget("Is this a self-employed position?", false, "", false),
                    FormBuilderRadioGroup<String>(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: jobPostController.yesNo[jobPostController.isSelfEmployed ? 0 : 1],
                      name: 'self_employed',
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      wrapSpacing: MediaQuery.of(context).size.width * 0.3,
                      onChanged: (value) => jobPostController.onSelfEmployed(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                      options: jobPostController.yesNo
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
                    const SizedBox(height: 15),
                    getQuestionsWidget(
                      "Is it an urgent requirement/ needs matching?",
                      true,
                      "Please note that we are unable to provide matching service for employed positions. "
                          "Click here for more information about our matching service.",
                      false,
                    ),
                    FormBuilderRadioGroup<String>(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: jobPostController.yesNo[jobPostController.isRequireUrgently ? 0 : 1],
                      name: 'urgent_require',
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      wrapSpacing: MediaQuery.of(context).size.width * 0.3,
                      onChanged: (value) => jobPostController.onUrgentRequirement(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                      options: jobPostController.yesNo
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
                    const SizedBox(height: 15),
                    if (jobPostController.isSelfEmployed) ...[
                      getQuestionsWidget("Are you the person needing care?", false, "", false),
                      FormBuilderRadioGroup<String>(
                        key: UniqueKey(),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: jobPostController.yesNo[jobPostController.isCareNeedFor ? 0 : 1],
                        name: 'care_need',
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        wrapSpacing: MediaQuery.of(context).size.width * 0.3,
                        onChanged: (value) => jobPostController.onCareNeedFor(),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                        options: jobPostController.yesNo
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
                      if (!jobPostController.isCareNeedFor) ...[
                        getQuestionsWidget("Are you authorised to post this job on behalf of Person?", false, "", false),
                        FormBuilderRadioGroup<String>(
                          key: UniqueKey(),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: jobPostController.yesNo[jobPostController.isAuthorized ? 0 : 1],
                          name: 'authorized',
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          wrapSpacing: MediaQuery.of(context).size.width * 0.3,
                          onChanged: (value) => jobPostController.onAuthorization(),
                          decoration: !jobPostController.isAuthorized
                              ? InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.only(top: 10),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  errorText: 'you are not permitted to post this job, Please contact customer support !',
                                  errorStyle: GoogleFonts.lexend(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: errorColor,
                                  ),
                                  errorMaxLines: 2,
                                )
                              : const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(top: 10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                          validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                          options: jobPostController.yesNo
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
                      ],
                    ] else ...[
                      getQuestionsWidget("Is the carer requested for a person or business?", false, "", false),
                      FormBuilderRadioGroup<String>(
                        key: UniqueKey(),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: jobPostController.requestedProfile[jobPostController.isRequestedProfile ? 0 : 1],
                        name: 'request_profile',
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        wrapSpacing: MediaQuery.of(context).size.width * 0.23,
                        onChanged: (value) => jobPostController.onProfileRequest(),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.only(top: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                        options: jobPostController.requestedProfile
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
                    ],
                    const SizedBox(height: 15),
                    getQuestionsWidget("You need care for ?", false, "", false),
                    FormBuilderRadioGroup<String>(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: jobPostController.profile[jobPostController.isRequireUrgently ? 0 : 1],
                      name: 'exist_new',
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      wrapSpacing: MediaQuery.of(context).size.width * 0.1,
                      onChanged: (value) => jobPostController.onProfileCheck(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                      options: jobPostController.profile
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
                    if (jobPostController.isExistingProfile) ...[
                      FormBuilderDropdown<String>(
                        key: UniqueKey(),
                        name: 'profile',
                        decoration: const InputDecoration(
                          hintText: 'Select Profile',
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: hintLightColor),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        items: jobPostController.eProfiles
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                      ),
                    ] else ...[
                      ElevatedButton(
                        onPressed: () => navigatorKey.currentState?.pushNamed(AppRouter.addNewProfile),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: lightWhiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(add, color: blackColor),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                                child: Text(
                                  addProfileText,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                  if (jobPostController.currentIndex == 2) ...[
                    getQuestionsWidget("Person needing care name and other details", false, "", false),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'f_name',
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: hintLightColor),
                          borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                        ),
                      ),
                      onChanged: (val) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'l_name',
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: hintLightColor),
                          borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                        ),
                      ),
                      onChanged: (val) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderDropdown<String>(
                            name: 'age',
                            decoration: const InputDecoration(
                              hintText: 'Age',
                              isDense: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: hintLightColor),
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            items: jobPostController.age
                                .map((value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: FormBuilderTextField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            name: 'postcode',
                            decoration: InputDecoration(
                              labelText: 'Postcode',
                              labelStyle: GoogleFonts.lexend(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: hintLightColor),
                                borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                              ),
                            ),
                            onChanged: (val) {},
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(),
                              ],
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'address',
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: hintLightColor),
                          borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                        ),
                      ),
                      onChanged: (val) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    getQuestionsWidget("Type of care*", false, "", false),
                    FormBuilderRadioGroup<String>(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: jobPostController.careType[jobPostController.isCareType ? 0 : 1],
                      name: 'care_type',
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      wrapSpacing: MediaQuery.of(context).size.width * 0.1,
                      onChanged: (value) => jobPostController.onProfileCheck(),
                      orientation: OptionsOrientation.vertical,
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                      options: jobPostController.careType
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
                    const SizedBox(height: 20),
                    getQuestionsWidget("Type of job*", false, "", false),
                    FormBuilderRadioGroup<String>(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: jobPostController.jobType[0],
                      name: 'job_type',
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      wrapSpacing: MediaQuery.of(context).size.width * 0.2,
                      onChanged: (value) => jobPostController.onGenderChange(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                      options: jobPostController.jobType
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
                    const SizedBox(height: 20),
                    getQuestionsWidget("When do you require care ?", false, "", false),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            key: UniqueKey(),
                            controller: dateInput,
                            decoration: InputDecoration(
                              labelText: "Start Date",
                              labelStyle: GoogleFonts.lexend(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(calender, width: 20, height: 10),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: hintLightColor),
                                borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(3000));

                              if (pickedDate != null) {
                                String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

                                dateInput.text = formattedDate;
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  key: UniqueKey(),
                                  controller: timeInput,
                                  decoration: InputDecoration(
                                    hintText: "00:00",
                                    hintStyle: GoogleFonts.lexend(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    suffixIcon: SizedBox(
                                      width: 10,
                                      child: FormBuilderDropdown<String>(
                                        icon: Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Image.asset(timeDropdown, width: 10, height: 10),
                                        ),
                                        name: 'format_type',
                                        initialValue: jobPostController.hoursFormat,
                                        decoration: const InputDecoration(
                                          hintText: 'Select Time',
                                          border: InputBorder.none,
                                        ),
                                        validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                                        items: jobPostController.hoursFormatList
                                            .map(
                                              (format) => DropdownMenuItem(
                                                value: format,
                                                child: Text(format),
                                              ),
                                            )
                                            .toList(),
                                        valueTransformer: (val) => val?.toString(),
                                      ),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(width: 1, color: hintLightColor),
                                      borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                                    ),
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    TimeOfDay? pickedTime = await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );

                                    if (pickedTime != null) {
                                      DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                      String formattedTime = DateFormat('HH:mm').format(parsedTime);

                                      timeInput.text = formattedTime;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    getQuestionsWidget("Preference of carer gender:", false, "", false),
                    const SizedBox(height: 15),
                    FormBuilderDropdown<String>(
                      key: UniqueKey(),
                      name: 'hours_per_week',
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(timeDropdown, width: 10, height: 10),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Number of hours per week',
                        hintStyle: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        isDense: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: hintLightColor),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      items: jobPostController.hoursPerWeek
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    getQuestionsWidget("Preference of carer gender:", false, "", false),
                    FormBuilderRadioGroup<String>(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: jobPostController.gender[0],
                      name: 'gender',
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      wrapSpacing: MediaQuery.of(context).size.width * 0.2,
                      onChanged: (value) => jobPostController.onGenderChange(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                      options: jobPostController.gender
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
                  ],
                  if (jobPostController.currentIndex == 3) ...[
                    getQuestionsWidget("You need care for which health conditions", false, "", false),
                    FormBuilderCheckboxGroup(
                      key: UniqueKey(),
                      name: 'health_condition',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) => jobPostController.onGenderChange(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      orientation: OptionsOrientation.vertical,
                      options: jobPostController.healthConditions
                          .map<FormBuilderFieldOption>(
                            (value) => FormBuilderFieldOption(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.lexend(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: hintColor,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                  if (jobPostController.currentIndex == 4) ...[
                    getQuestionsWidget("What services you need from the carer ?", false, "", false),
                    FormBuilderCheckboxGroup(
                      key: UniqueKey(),
                      name: 'service_need_for',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) => jobPostController.onGenderChange(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      orientation: OptionsOrientation.vertical,
                      options: jobPostController.listServiceRequiredFor
                          .map<FormBuilderFieldOption>(
                            (value) => FormBuilderFieldOption(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.lexend(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: hintColor,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    getQuestionsWidget("Things you enjoy", false, "", false),
                    FormBuilderCheckboxGroup(
                      key: UniqueKey(),
                      name: 'things_enjoy',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) => jobPostController.onGenderChange(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      orientation: OptionsOrientation.vertical,
                      options: jobPostController.listThingsYouEnjoy
                          .map<FormBuilderFieldOption>(
                            (value) => FormBuilderFieldOption(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.lexend(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: hintColor,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    getQuestionsWidget("Languages you speak", false, "", true),
                    FormBuilderCheckboxGroup(
                      key: UniqueKey(),
                      name: 'language_speak',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) => jobPostController.onGenderChange(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      orientation: OptionsOrientation.vertical,
                      options: jobPostController.listLanguagesSpeak
                          .map<FormBuilderFieldOption>(
                            (value) => FormBuilderFieldOption(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.lexend(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: hintColor,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                  if (jobPostController.currentIndex == 5) ...[
                    getQuestionsWidget("Do you have access to funding ?", false, "", false),
                    FormBuilderRadioGroup<String>(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: jobPostController.yesNo[0],
                      name: 'funding',
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      wrapSpacing: MediaQuery.of(context).size.width * 0.3,
                      onChanged: (value) => jobPostController.onFundingChange(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                      options: jobPostController.yesNo
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
                    const SizedBox(height: 20),
                    getQuestionsWidget("Type of Funding?", false, "", false),
                    const SizedBox(height: 15),
                    FormBuilderDropdown<String>(
                      key: UniqueKey(),
                      name: 'funding_type',
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(timeDropdown, width: 10, height: 10),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Select option',
                        hintStyle: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        isDense: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: hintLightColor),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      items: jobPostController.listFundingType
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    getQuestionsWidget("How much you are willing to pay per hour?", false, "", false),
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'pay_per_hour',
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        labelStyle: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: hintLightColor),
                          borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                        ),
                      ),
                      onChanged: (val) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    getQuestionsWidget("Do you have a care plan to upload?", false, "", false),
                    FormBuilderRadioGroup<String>(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: jobPostController.yesNo[0],
                      name: 'care_plan',
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      wrapSpacing: MediaQuery.of(context).size.width * 0.3,
                      onChanged: (value) => jobPostController.onCarePlanChange(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                      options: jobPostController.yesNo
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
                    if (jobPostController.isCarePlan) ...[
                      const SizedBox(height: 15),
                      FormBuilderTextField(
                        key: UniqueKey(),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        name: 'upload',
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: jobPostController.fileName,
                          hintStyle: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: hintLightColor),
                            borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                          ),
                          suffixIcon: InkWell(
                            onTap: () => jobPostController.pickFiles(),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0, top: 4.0, bottom: .0, right: 25.0),
                              child: Image.asset(upload, width: 20, height: 20),
                            ),
                          ),
                        ),
                        onChanged: (val) {},
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                    const SizedBox(height: 20),
                    getQuestionsWidget("Any other specific care requirement, likes, dislikes or instructions?", false, "", false),
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      key: UniqueKey(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'details',
                      maxLines: 6,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        labelText: "Enter Details",
                        labelStyle: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        alignLabelWithHint: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: hintLightColor),
                          borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                        ),
                      ),
                      onChanged: (val) {},
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed: () => jobPostController.updatePageStepper(
                  jobPostController.currentIndex <= 6 ? (jobPostController.currentIndex + 1) : jobPostController.currentIndex,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                          child: Text(
                            jobPostController.currentIndex == 5 ? viewJobText : nextText,
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    jobPostController.currentIndex == 5 ? Image.asset(viewJob) : Image.asset(next),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
