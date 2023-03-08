import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/account/settings/change_password/change_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends ConsumerWidget {
  ChangePassword({Key? key}) : super(key: key);

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changePassController = ref.watch(changePassProvider);

    return Scaffold(
      appBar: getAppBar("", true, context),
      body: ListView(
        children: [
          Center(
            child: Text(
              changePasswordText,
              style: GoogleFonts.lexend(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: FormBuilder(
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
                    name: 'old_password',
                    obscureText: changePassController.isHideOldPass,
                    decoration: InputDecoration(
                      labelText: 'Old Password',
                      labelStyle: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: InkWell(
                        onTap: () => changePassController.onOldPassVisibility(),
                        child: Icon(changePassController.isHideOldPass
                            ? Icons.visibility_off
                            : Icons.visibility),
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
                    name: 'new_password',
                    obscureText: changePassController.isHideNewPass,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      labelStyle: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: InkWell(
                        onTap: () => changePassController.onNewPassVisibility(),
                        child: Icon(changePassController.isHideNewPass
                            ? Icons.visibility_off
                            : Icons.visibility),
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
                    name: 'confirm_password',
                    obscureText: changePassController.isHideConfirmPass,
                    decoration: InputDecoration(
                      labelText: 'Confirm new password',
                      labelStyle: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: InkWell(
                        onTap: () => changePassController.onConfirmPassVisibility(),
                        child: Icon(changePassController.isHideConfirmPass
                            ? Icons.visibility_off
                            : Icons.visibility),
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
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () => changePassController.onPasswordChange(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkPurpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                    child: Text(
                      changePasswordText,
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
          ),
        ],
      ),
    );
  }
}
