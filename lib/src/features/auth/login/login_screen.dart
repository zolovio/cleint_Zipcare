import 'package:client_zipcare/src/core/components/custom_button.dart';
import 'package:client_zipcare/src/core/components/custom_checkbox.dart';
import 'package:client_zipcare/src/core/components/custom_text_field.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/core/constants/dimensions.dart';
import 'package:client_zipcare/src/core/constants/font_styles.dart';
import 'package:client_zipcare/src/features/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginCon = ref.watch(loginProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                signInText,
                style: GoogleFonts.lexend(
                  fontSize: font_25,
                  fontWeight: fontWeight400,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            SizedBox(height: height_60),
            FormBuilder(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
              },
              autovalidateMode: AutovalidateMode.disabled,
              skipDisabled: true,
              child: Column(
                children: <Widget>[
                  CustomTextField(
                    name: 'email',
                    labelText: 'Email Address',
                    fontSize: font_13,
                    fontWeight: fontWeight400,
                    formBuilderValidators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ],
                    inputType: TextInputType.emailAddress,
                    radius: radius_15,
                  ),
                  SizedBox(height: height_20),
                  // CustomTextField(
                  //   name: 'password',
                  //   labelText: 'Password',
                  //   fontSize: font_13,
                  //   fontWeight: fontWeight400,
                  //   formBuilderValidators: [
                  //     FormBuilderValidators.required(),
                  //   ],
                  //   inputType: TextInputType.emailAddress,
                  //   radius: radius_15,
                  //   suffixIcon: loginCon.isHide ? Icons.visibility_off : Icons.visibility,
                  //   onTap: () => loginCon.onPasswordHideChange(),
                  // ),
                  FormBuilderTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    name: 'password',
                    obscureText: !loginCon.isHide,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: GoogleFonts.lexend(
                        fontSize: font_13,
                        fontWeight: fontWeight400,
                      ),
                      suffixIcon: InkWell(
                        onTap: () => loginCon.onPasswordHideChange(),
                        child: Icon(loginCon.isHide ? Icons.visibility_off : Icons.visibility),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.lighterGreyColor),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      enabledBorder: const OutlineInputBorder(
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
                  Row(
                    children: [
                      Expanded(
                        child: CustomCheckBox(
                          name: 'accept_terms',
                          title: 'Remember me',
                          fontSize: font_14,
                          errorText: 'You must accept terms and conditions to continue',
                          onChanged: () {},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => loginCon.onForgotPassword(),
                          child: Text(
                            '$forgotPassText?',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.lexend(
                              fontSize: font_14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkPurpleColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.darkPurpleColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height_10),
            CustomButton(
              onPressed: () => loginCon.onLogin(),
              title: signInText,
              buttonColors: AppColors.darkPurpleColor,
              textColors: AppColors.whiteColor,
              buttonHeight: height_45,
              radius: radius_15,
              fontSize: font_17,
              fontWeight: fontWeight600,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(margin_20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account? ',
              style: GoogleFonts.lexend(
                fontSize: font_14,
                fontWeight: fontWeight400,
                color: AppColors.darkGreyColor,
              ),
            ),
            SizedBox(width: width_5),
            InkWell(
              onTap: () => loginCon.onSignUp(),
              child: Text(
                signUpText,
                style: GoogleFonts.lexend(
                  fontSize: font_14,
                  fontWeight: fontWeight500,
                  color: AppColors.darkPurpleColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
