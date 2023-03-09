import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/components/custom_widgets.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/profile/new_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewProfile extends ConsumerWidget {
  AddNewProfile({Key? key}) : super(key: key);

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newProfileController = ref.watch(newProfileProvider);

    return Scaffold(
      appBar: getAppBar(context, newProfileText, true, true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            getStepperWidget("", "", false),
            FormBuilder(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
              },
              autovalidateMode: AutovalidateMode.disabled,
              skipDisabled: true,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 15),
                    getQuestionsWidget(
                        "Person needing care name and other details", false, "", false),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'f_name',
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'l_name',
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
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
                                borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            items: newProfileController.age
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
                                borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(textFieldBorderRadius)),
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'address',
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: GoogleFonts.lexend(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
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
                    const SizedBox(height: 15),
                    getQuestionsWidget("Preference of carer gender:", false, "", false),
                    FormBuilderRadioGroup<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: newProfileController.gender[0],
                      name: 'gender',
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      wrapSpacing: MediaQuery.of(context).size.width * 0.2,
                      onChanged: (value) => newProfileController.onGenderChange(),
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                      options: newProfileController.gender
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
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkPurpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                    child: Text(
                      saveText,
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
