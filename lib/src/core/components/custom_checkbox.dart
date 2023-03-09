import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    required this.name,
    this.initialValue = false,
    required this.onChanged,
    required this.title,
    required this.fontSize,
    this.fontWeight = fontWeight500,
    this.textColor = AppColors.slateColor,
    required this.errorText,
  }) : super(key: key);

  final String name;
  final bool initialValue;
  final Function onChanged;
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      horizontalTitleGap: 0,
      child: FormBuilderCheckbox(
        name: name,
        initialValue: initialValue,
        contentPadding: EdgeInsets.zero,
        onChanged: (value) => onChanged,
        title: Text(
          title,
          style: GoogleFonts.lexend(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
        validator: FormBuilderValidators.equal(
          true,
          errorText: errorText,
        ),
      ),
    );
  }
}
