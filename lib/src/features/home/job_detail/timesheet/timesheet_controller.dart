import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/job_detail/timesheet/timesheet_tabs/timesheet_tabs_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timesheetProvider = ChangeNotifierProvider.autoDispose((ref) => TimesheetController());

class TimesheetController extends ChangeNotifier {
  TimesheetController();

  int selectedIndex = 0;

  final List<Widget> pages = [
    const TimesheetTabsScreen(status: "Approved"),
    const TimesheetTabsScreen(status: "Pending"),
    const TimesheetTabsScreen(status: "Cancelled"),
  ];

  void onSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
