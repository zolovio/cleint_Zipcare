import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_screen/invoice/invoice_screen/invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum JobStatus { active, completed, rejected }

final jobDetailProvider = ChangeNotifierProvider.autoDispose((ref) => JobDetailController());

class JobDetailController extends ChangeNotifier {
  JobDetailController();

  int? maxLines = 2;
  bool isReadMore = false;

  bool switchApplicationMode = true;
  bool isShortlisted = true;

  String userName = "John Watson";
  String jobId = "Job Id: #126565";

  List<List<String>> profileUserDetails = [
    [jobDetailUser, "53 year", ""],
    [locationBlue, "W2P, London", ""],
    [calenderGreen, "22-07-2022", "4:00pm"],
  ];

  List<Map<String, dynamic>> jobDetail = [
    {
      "title": "Female Hourly Day carer required.",
      "location": "635 Jacabs Stream",
      "employment": "Self-Employed",
      "date_time": "22-07-2022, 4:00pm",
      "hrs": "4 hours/week",
      "specification": ["Hourly", "Driver Required", "Female", "Pet friendly", "Autism spectrum disorder"],
      "posted_on": "Posted on- 11 Aug 2022",
      "status": [JobStatus.active, "Active Job"],
      "details": [
        {
          "ques": "Carer allocation status",
          "ans": ["Yes"],
          "bg": true,
        },
        {
          "ques": "Is this a self-employed position?",
          "ans": ["Yes"],
          "bg": true,
        },
        {
          "ques": "Is it an urgent requirement/ needs matching?",
          "ans": ["Yes"],
          "bg": true,
        },
        {
          "ques": "Is the carer requested for a person or business?",
          "ans": ["Yes"],
          "bg": true,
        },
        {
          "ques": "Are you the person needing care?",
          "ans": ["Yes"],
          "bg": true,
        },
        {
          "ques": "Type of care*",
          "ans": ["Hourly"],
          "bg": true,
        },
        {
          "ques": "Type of job*",
          "ans": ["One Time"],
          "bg": true,
        },
        {
          "ques": "When do you require care ?",
          "ans": [" 24-sep-2022", " 4PM"],
          "bg": false,
        },
        {
          "ques": "Carer’s Gender",
          "ans": ["Female"],
          "bg": true,
        },
        {
          "ques": "You need care for which health conditions.",
          "ans": ["Eating Disorder", "Learning Disabilities", "Mental Health"],
          "bg": true,
        },
        {
          "ques": "Services you need from the carer",
          "ans": ["Cooking", "Hoisting", "Gardening"],
          "bg": true,
        },
        {
          "ques": "Access to funding?",
          "ans": ["Yes"],
          "bg": true,
        },
      ]
    },
  ];

  String requirementsText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
      "Lorem Ipsum has been the industry's standard dummy text ever since the1500s."
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
      "Lorem Ipsum has been the industry's standard dummy text ever since the1500s.";

  void onSwitchApplicationMode() {
    switchApplicationMode = !switchApplicationMode;
    notifyListeners();
  }

  void onReadMoreText() {
    isReadMore = !isReadMore;
    maxLines = isReadMore ? null : 3;

    notifyListeners();
  }

  onJobCompleted() {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => const InvoiceScreen(jobCompleted: true),
      ),
    );
  }
}
