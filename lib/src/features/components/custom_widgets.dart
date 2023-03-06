import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar getAppBar(String title, bool showAction, BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: true,
    backgroundColor: lightWhiteColor,
    iconTheme: const IconThemeData(color: blackColor),
    leading:
        IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
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
        InkWell(
          onTap: () => navigatorKey.currentState?.pushNamed(AppRouter.notification),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(child: Image.asset(notification)),
          ),
        ),
    ],
  );
}

AppBar getSimpleAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: true,
    backgroundColor: lightWhiteColor,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.keyboard_backspace),
      color: blackColor,
      onPressed: () => Navigator.pop(context),
    ),
  );
}

PreferredSize homeAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
    child: Container(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: lightWhiteColor,
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                logo,
                fit: BoxFit.cover,
              ),
            ),
            title: ElevatedButton(
              onPressed: () => navigatorKey.currentState?.pushNamed(AppRouter.jobPostScreen),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
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
              InkWell(
                onTap: () => navigatorKey.currentState?.pushNamed(AppRouter.notification),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(child: Image.asset(notification)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget getStepperWidget(String currentIndex, String totalIndices, bool showStepper) {
  return Column(
    children: [
      const SizedBox(height: 15),
      Text(
        careDetail,
        style: GoogleFonts.lexend(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      ),
      if (showStepper) ...[
        const SizedBox(height: 8),
        Wrap(
          children: [
            Text(
              currentIndex,
              style: GoogleFonts.lexend(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ),
            Text(
              totalIndices,
              style: GoogleFonts.lexend(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
          ],
        ),
      ],
    ],
  );
}

Widget getQuestionsWidget(String ques, bool isDetail, String detail, bool isIcon) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: isIcon ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              ques,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lexend(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: darkGreyColor,
              ),
            ),
          ),
          if (isIcon) ...[
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(search),
              ),
            ),
          ],
        ],
      ),
      if (isDetail) ...[
        const SizedBox(height: 10),
        Text(
          detail,
          style: GoogleFonts.lexend(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: underlineColor,
          ),
        ),
      ],
    ],
  );
}

Future<void> showDialogAlert(
  BuildContext context,
  String title,
  String label,
  TextEditingController controller,
  bool showField,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.all(0.0),
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: FractionalOffset.topRight,
                  child: GestureDetector(
                    child: Image.asset(cut),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: blackColor,
                ),
              ),
            ),
          ],
        ),
        content: showField
            ? SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller,
                      name: 'cancel',
                      maxLines: 5,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        labelText: label,
                        labelStyle: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                        alignLabelWithHint: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: hintLightColor),
                          borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                        ),
                      ),
                      onChanged: (val) {},
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
              )
            : null,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => navigatorKey.currentState?.pop(),
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: primaryColor.withOpacity(.5),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  child: Center(
                    child: Text(
                      submitText,
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

Future<void> showRatingDialog(
  BuildContext context,
  String image,
  String title,
  String subTitle,
  String fieldName,
  TextEditingController controller,
  String label,
) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        title: Image.asset(
          saveImage,
          width: 150,
          height: 150,
        ),
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            subTitle,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller,
                  name: 'label',
                  maxLines: 5,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: label,
                    hintStyle: GoogleFonts.lexend(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                    alignLabelWithHint: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: hintLightColor),
                      borderRadius: BorderRadius.all(Radius.circular(textFieldBorderRadius)),
                    ),
                  ),
                  onChanged: (val) {},
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => navigatorKey.currentState?.pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Center(
                    child: Text(
                      submitText,
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      );
    },
  );
}
