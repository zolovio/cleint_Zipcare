import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/auth/login/login/login_controller.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
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
      appBar: getAppBar(signInText, false, context),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          FormBuilder(
            key: _formKey,
            onChanged: () {
              _formKey.currentState!.save();
            },
            autovalidateMode: AutovalidateMode.disabled,
            skipDisabled: true,
            child: Column(
              children: <Widget>[
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
                      borderSide: BorderSide(width: 1, color: hintLightColor),
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
                  obscureText: !loginCon.isHide,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: InkWell(
                      onTap: () => loginCon.onPasswordHideChange(),
                      child: Icon(loginCon.isHide ? Icons.visibility_off : Icons.visibility),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: hintLightColor),
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
                FormBuilderCheckbox(
                  name: 'accept_terms',
                  initialValue: false,
                  onChanged: _onChanged,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Remember me',
                        style: GoogleFonts.lexend(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: rememberMeColor,
                        ),
                      ),
                      Text(
                        '$forgotPassText?',
                        style: GoogleFonts.lexend(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: underlineColor,
                        ),
                      ),
                    ],
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
                onPressed: () => navigatorKey.currentState?.pushNamed(AppRouter.forgotPassScreen),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                    child: Text(
                      signInText,
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
