import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/job_post/job_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class JobPostScreen extends ConsumerWidget {
  JobPostScreen({Key? key}) : super(key: key);

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobPostController = ref.watch(jobPostProvider);

    return Scaffold(
      appBar: getAppBar(jobPost, true, context),
      body: ListView(
        children: [
          getStepperWidget("${jobPostController.currentIndex}", "/${jobPostController.totalIndices}"),
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
                  getQuestionsWidget("Is this a self-employed position?", false, ""),
                  FormBuilderRadioGroup<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: jobPostController.yesNo[jobPostController.isSelfEmployed ? 0 : 1],
                    name: 'self_employed',
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    wrapSpacing: MediaQuery.of(context).size.width * 0.2,
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
                  ),
                  FormBuilderRadioGroup<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: jobPostController.yesNo[jobPostController.isRequireUrgently ? 0 : 1],
                    name: 'urgent_require',
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    wrapSpacing: MediaQuery.of(context).size.width * 0.2,
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
                  getQuestionsWidget(
                    "Are you the person needing care?",
                    false,
                    "",
                  ),
                  FormBuilderRadioGroup<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: jobPostController.yesNo[jobPostController.isCareNeedFor ? 0 : 1],
                    name: 'care_need',
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    wrapSpacing: MediaQuery.of(context).size.width * 0.2,
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
                  const SizedBox(height: 15),
                  getQuestionsWidget(
                    "You need care for ?",
                    false,
                    "",
                  ),
                  FormBuilderRadioGroup<String>(
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
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    name: 'city',
                    decoration: InputDecoration(
                      labelText: 'City',
                      labelStyle: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: greyColor),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
