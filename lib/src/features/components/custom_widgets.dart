import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWidgets {
  AppBar getAppBar(String title, bool showAction, BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: true,
      backgroundColor: lightWhiteColor,
      iconTheme: const IconThemeData(color: blackColor),
      leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)),
      title: Text(
        title,
        style: GoogleFonts.lexend(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      ),
      actions: [
        if (showAction)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(child: Image.asset(notification)),
          )
      ],
    );
  }

  PreferredSize homeAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.255),
      child: Container(
        padding: const EdgeInsets.only(top: 15.0),
        color: whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: whiteColor,
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  logo,
                  fit: BoxFit.cover,
                ),
              ),
              title: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // <-- Radius
                  ),
                ),
                child: Text(
                  postAJobText,
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: whiteColor,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(child: Image.asset(notification)),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
                child: FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  name: 'search',
                  decoration: InputDecoration(
                    hintText: 'Search for carers',
                    hintStyle: GoogleFonts.lexend(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: hintLightColor,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.search, color: hintColor),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: greyColor),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onChanged: (val) {},
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      filterText,
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  availableCarerText,
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: blackColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
