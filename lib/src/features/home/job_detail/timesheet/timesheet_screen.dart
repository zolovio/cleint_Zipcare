import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/job_detail/timesheet/timesheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TimesheetScreen extends ConsumerWidget {
  const TimesheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timesheetController = ref.watch(timesheetProvider);

    return Scaffold(
      appBar: getAppBar(listTimesheetText, true, context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Text(
              '“Please select yes if you want to receive daily timesheets instead of weekly ones.”',
              maxLines: 2,
              style: GoogleFonts.lexend(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: hintColor,
              ),
            ),
            FormBuilderRadioGroup<String>(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initialValue: "Yes",
              name: 'weekly_reports',
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              wrapSpacing: MediaQuery.of(context).size.width * 0.3,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(top: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              options: ["Yes", "No"]
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(80),
                    child: AppBar(
                      backgroundColor: lightWhiteColor,
                      elevation: 0,
                      bottom: TabBar(
                        unselectedLabelColor: lightGreyColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color: primaryColor),
                        onTap: (int index) => timesheetController.onSelectedIndex(index),
                        tabs: [
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: timesheetController.selectedIndex == 0
                                          ? primaryColor
                                          : lightGreyColor,
                                      width: 1)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  approvedText,
                                  style:
                                      GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: timesheetController.selectedIndex == 1
                                          ? primaryColor
                                          : lightGreyColor,
                                      width: 1)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  pendingText,
                                  style:
                                      GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: timesheetController.selectedIndex == 2
                                          ? primaryColor
                                          : lightGreyColor,
                                      width: 1)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  rejectedText,
                                  style:
                                      GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: timesheetController.pages,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
