import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum JobStatus { active, completed, rejected }

final jobDetailProvider = ChangeNotifierProvider.autoDispose((ref) => JobDetailController());

class JobDetailController extends ChangeNotifier {
  JobDetailController();

  bool switchApplicationMode = true;

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
    },
  ];

  void onSwitchApplicationMode() {
    switchApplicationMode = !switchApplicationMode;
    notifyListeners();
  }
}
