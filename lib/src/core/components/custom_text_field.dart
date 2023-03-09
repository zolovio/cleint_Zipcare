import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    required this.name,
    required this.labelText,
    required this.fontSize,
    required this.fontWeight,
    this.borderColor = AppColors.lighterGreyColor,
    this.borderWidth = 1,
    required this.radius,
    required this.formBuilderValidators,
    required this.inputType,
    this.suffixIcon,
    this.onTap,
  });

  final AutovalidateMode autoValidateMode;
  final String name;
  final String labelText;
  final double fontSize;
  final FontWeight fontWeight;
  final Color borderColor;
  final double borderWidth;
  final double radius;
  final List<String? Function(String?)> formBuilderValidators;
  final TextInputType inputType;
  final IconData? suffixIcon;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: name,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.lexend(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: () => onTap,
                child: Icon(suffixIcon),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: borderWidth, color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: borderWidth, color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
      onChanged: (val) {},
      validator: FormBuilderValidators.compose(
        formBuilderValidators,
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}
