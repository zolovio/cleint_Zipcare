import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timesheetDetailProvider =
    ChangeNotifierProvider.autoDispose((ref) => TimesheetDetailController());

class TimesheetDetailController extends ChangeNotifier {
  TimesheetDetailController();

  Map<String, dynamic> timesheetDetails = {
    "date": {"title": "Date", "date": "24-10-2022"},
    "time": {"title": "Start/End Time", "time": "2:00pm  5:00pm"},
    "break_time": {"title": "Break Time", "time": "1hr"},
    "hour_type": {"title": "Type of Hour", "hour": "4hr/week"},
    "no": {"title": "Invoive No.", "no": "INV17307"},
    "job_id": {"title": "Job Id", "id": "126565"},
    "agreement_no": {"title": "Service Agreement No.", "no": "AG20347"},
    "address": "28 Narrowboat Close, Coventry, CV6 6RD, UK",
    "expense": {"title": "Expenses", "value": "PPE kit"},
    "cost": {"title": "Cost", "value": "£ 500"},
    "description": {
      "title": "Description",
      "value":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
    },
    "sub_total": {"title": "Sub Total", "value": "£ 200"},
    "expenses": {"title": "Expenses", "value": "£ 500"},
    "total": {"title": "Grand Total", "value": "£ 700"},
  };

  void onApproved() {
    navigatorKey.currentState?.pushNamed(AppRouter.paymentScreen);
  }
}
