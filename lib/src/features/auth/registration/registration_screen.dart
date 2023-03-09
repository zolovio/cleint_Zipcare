// ignore_for_file: must_be_immutable

import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/auth/registration/registration_controller.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends ConsumerWidget {
  RegistrationScreen({super.key});

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(registrationProvider);

    return Scaffold(
      appBar: getAppBar(context, signUpText, false, true),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            'Are you an individual or a business?',
            style: GoogleFonts.lexend(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
          FormBuilder(
            key: _formKey,
            onChanged: () {
              _formKey.currentState!.save();
            },
            autovalidateMode: AutovalidateMode.disabled,
            skipDisabled: true,
            child: Column(
              children: <Widget>[
                FormBuilderRadioGroup<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: controller.isBusiness ? 'Business' : 'Individual',
                  name: 'individual_or_business',
                  onChanged: (value) => controller.onBusinessSelected(),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                  options: ['Individual', 'Business']
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
                if (controller.isBusiness) ...[
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    name: 'b_name',
                    decoration: InputDecoration(
                      labelText: 'Name of Business',
                      labelStyle: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
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
                  const SizedBox(height: 20),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    name: 'designation',
                    decoration: InputDecoration(
                      labelText: 'Person\'s Designation',
                      labelStyle: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
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
                  const SizedBox(height: 20),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    name: 'website',
                    decoration: InputDecoration(
                      labelText: 'Website',
                      labelStyle: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
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
                  const SizedBox(height: 20),
                ],
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
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  onChanged: (val) {},
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.max(70),
                    ],
                  ),
                  keyboardType: TextInputType.name,
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
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  onChanged: (val) {},
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.max(70),
                    ],
                  ),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  name: 'email',
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  onChanged: (val) {},
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ],
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  name: 'phone',
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  onChanged: (val) {},
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ],
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  name: 'password',
                  obscureText: !controller.isHide,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: InkWell(
                      onTap: () => controller.onPasswordHideChange(),
                      child: Icon(controller.isHide ? Icons.visibility_off : Icons.visibility),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  onChanged: (val) {},
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.max(70),
                    ],
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  name: 'country',
                  readOnly: true,
                  controller: TextEditingController(text: controller.countryName),
                  decoration: InputDecoration(
                    hintText: 'Country',
                    hintStyle: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          favorite: <String>['PK'],
                          showPhoneCode: true,
                          onSelect: (Country country) => controller.changeCountry(country.name),
                          countryListTheme: CountryListThemeData(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                            inputDecoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                            searchTextStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                          ),
                        );
                      },
                      child: const Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  onChanged: (val) {},
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.max(70),
                    ],
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
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
                      borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
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
                const SizedBox(height: 20),
                FormBuilderTextField(
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
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  onChanged: (val) {},
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 20),
                FormBuilderCheckbox(
                  name: 'accept_terms',
                  initialValue: false,
                  onChanged: _onChanged,
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'I agree to the ',
                          style: GoogleFonts.lexend(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms & Conditions .',
                          style: GoogleFonts.lexend(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkPurpleColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.mediumGreyColor,
                          ),
                          /*
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('launch url');
                                },
                              */
                        ),
                      ],
                    ),
                  ),
                  validator: FormBuilderValidators.equal(
                    true,
                    errorText: 'You must accept terms and conditions to continue',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: ElevatedButton(
                onPressed: () => controller.onLogin(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkPurpleColor,
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
                            saveNextText,
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Icon(Icons.save_as),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: GoogleFonts.lexend(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  onTap: () => controller.onLogin(),
                  child: Text(
                    loginText,
                    style: GoogleFonts.lexend(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkPurpleColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
