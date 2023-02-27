import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/features/home/job_detail/allocated/allocated_profile/allocated_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum JobStatus { active, completed, rejected }

final approvedJobProvider = ChangeNotifierProvider.autoDispose((ref) => ApprovedJobController());

class ApprovedJobController extends ChangeNotifier {
  ApprovedJobController();

  List<Map<String, dynamic>> approvedJobsList = [
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
    {
      "title": "Female Hourly Day carer required.",
      "location": "635 Jacabs Stream",
      "employment": "Self-Employed",
      "date_time": "22-07-2022, 4:00pm",
      "hrs": "4 hours/week",
      "specification": ["Hourly", "Driver Required", "Female", "Pet friendly", "Autism spectrum disorder"],
      "posted_on": "Posted on- 11 Aug 2022",
      "status": [JobStatus.completed, "Completed"],
    },
    {
      "title": "Urgent Female Hourly Day carer required.",
      "location": "635 Jacabs Stream",
      "employment": "Self-Employed",
      "date_time": "22-07-2022, 4:00pm",
      "hrs": "4 hours/week",
      "specification": ["Hourly", "Driver Required", "Female", "Pet friendly", "Autism spectrum disorder"],
      "posted_on": "Posted on- 11 Aug 2022",
      "status": [JobStatus.active, "Active Job"],
    },
  ];

  void onActiveJob() {
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) => const AllocatedProfile(isApproved: true)));
  }
}
