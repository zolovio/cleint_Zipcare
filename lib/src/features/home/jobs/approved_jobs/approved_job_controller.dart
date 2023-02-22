import 'package:flutter/widgets.dart';
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
}
