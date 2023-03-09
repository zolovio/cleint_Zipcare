import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.buttonColors,
    required this.textColors,
    this.buttonWidth,
    required this.buttonHeight,
    required this.radius,
    required this.fontSize,
    required this.fontWeight,
    this.icon,
  });

  final Function onPressed;
  final String title;
  final Color buttonColors;
  final Color textColors;
  final double? buttonWidth;
  final double buttonHeight;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        alignment: Alignment.center,
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(color: buttonColors, borderRadius: BorderRadius.circular(radius)),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 50),
                  Text(
                    title,
                    style: GoogleFonts.lexend(
                      fontWeight: fontWeight,
                      color: textColors,
                      fontSize: fontSize,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(icon, color: textColors),
                  ),
                ],
              )
            : Text(
                title,
                style: GoogleFonts.lexend(
                  fontWeight: fontWeight,
                  color: textColors,
                  fontSize: fontSize,
                ),
              ),
      ),
    );
  }
}
