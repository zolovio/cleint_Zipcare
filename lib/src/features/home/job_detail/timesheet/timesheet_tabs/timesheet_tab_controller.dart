import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/job_detail/timesheet/timesheet_tabs/timesheet_detail/timesheet_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timesheetTabProvider = ChangeNotifierProvider.autoDispose((ref) => TimesheetTabController());

class TimesheetTabController extends ChangeNotifier {
  TimesheetTabController();

  List<Map<String, String>> timesheetList = [
    {
      "logo": logo,
      "name": "Timesheet 1",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Approved"
    },
    {
      "logo": logo,
      "name": "Timesheet 2",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Approved"
    },
    {
      "logo": logo,
      "name": "Timesheet 3",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Approved"
    },
    {
      "logo": logo,
      "name": "Timesheet 4",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Approved"
    },
    {
      "logo": logo,
      "name": "Timesheet 1",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Pending"
    },
    {
      "logo": logo,
      "name": "Timesheet 2",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Pending"
    },
    {
      "logo": logo,
      "name": "Timesheet 3",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Pending"
    },
    {
      "logo": logo,
      "name": "Timesheet 4",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Pending"
    },
    {
      "logo": logo,
      "name": "Timesheet 1",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Cancelled"
    },
    {
      "logo": logo,
      "name": "Timesheet 2",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Cancelled"
    },
    {
      "logo": logo,
      "name": "Timesheet 3",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Cancelled"
    },
    {
      "logo": logo,
      "name": "Timesheet 4",
      "date": "02/08/2022",
      "amount": "+ £30",
      "status": "Cancelled"
    },
  ];

  void onTimesheetTap(String title) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => TimesheetDetailScreen(title: title),
      ),
    );
  }
}
