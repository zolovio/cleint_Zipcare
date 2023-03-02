import 'package:client_zipcare/src/core/constants/constants.dart';
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
}
