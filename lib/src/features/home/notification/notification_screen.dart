import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/notification/notification_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationController = ref.watch(notificationProvider);

    return Scaffold(
      appBar: getAppBar(notificationText, false, context),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: InputBorder.none,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  hint: Text(
                    'All',
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: blackColor,
                    ),
                  ),
                  items: notificationController.filterItems
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: blackColor,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                  onSaved: (value) => notificationController.onFilterSelected(value!.toString()),
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: blackColor),
                      color: shadowColor,
                    ),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      color: shadowColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      markReadText,
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(tickButton, width: 20, height: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            children: notificationController.notificationsList
                .map<Widget>(
                  (notification) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(notification["img"]),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification["title"],
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: blackColor,
                                ),
                              ),
                              if (notification["type"] == "button") ...[
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: deepGreenColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 15.0),
                                        child: Text(
                                          acceptText,
                                          style: GoogleFonts.lexend(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: redColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 15.0),
                                        child: Text(
                                          rejectText,
                                          style: GoogleFonts.lexend(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              if (notification["type"] == "comment") ...[
                                const SizedBox(height: 10),
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      const VerticalDivider(
                                        color: hintLightColor,
                                        thickness: 2,
                                        indent: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          notification["comment"],
                                          style: GoogleFonts.lexend(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: hintColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                              const SizedBox(height: 5),
                              Text(
                                notification["time"],
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: lightGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
