import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ApplicationStatus { accepting, notAccepting, waiting }

final postedJobProvider = ChangeNotifierProvider.autoDispose((ref) => PostedJobController());

class PostedJobController extends ChangeNotifier {
  PostedJobController();

  List<Map<String, dynamic>> postedJobsList = [
    {
      "title": "Female Hourly Day carer required.",
      "location": "635 Jacabs Stream",
      "employment": "Self-Employed",
      "date_time": "22-07-2022, 4:00pm",
      "hrs": "4 hours/week",
      "specification": ["Hourly", "Driver Required", "Female", "Pet friendly", "Autism spectrum disorder"],
      "posted_on": "Posted on- 11 Aug 2022",
      "status": [ApplicationStatus.accepting, "Accepting Applications"],
    },
    {
      "title": "Female Hourly Day carer required.",
      "location": "635 Jacabs Stream",
      "employment": "Self-Employed",
      "date_time": "22-07-2022, 4:00pm",
      "hrs": "4 hours/week",
      "specification": ["Hourly", "Driver Required", "Female", "Pet friendly", "Autism spectrum disorder"],
      "posted_on": "Posted on- 11 Aug 2022",
      "status": [ApplicationStatus.notAccepting, "Not Accepting Applications"],
    },
    {
      "title": "Urgent Female Hourly Day carer required.",
      "location": "635 Jacabs Stream",
      "employment": "Self-Employed",
      "date_time": "22-07-2022, 4:00pm",
      "hrs": "4 hours/week",
      "specification": ["Hourly", "Driver Required", "Female", "Pet friendly", "Autism spectrum disorder"],
      "posted_on": "Posted on- 11 Aug 2022",
      "status": [ApplicationStatus.waiting, "Waiting for a Match"],
    },
    {
      "title": "Urgent Female Hourly Day carer required.",
      "location": "635 Jacabs Stream",
      "employment": "Self-Employed",
      "date_time": "22-07-2022, 4:00pm",
      "hrs": "4 hours/week",
      "specification": ["Hourly", "Driver Required", "Female", "Pet friendly", "Autism spectrum disorder"],
      "posted_on": "Posted on- 11 Aug 2022",
      "status": [ApplicationStatus.notAccepting, "Not Accepting Applications"],
    },
    {
      "title": "Female Hourly Day carer required.",
      "location": "635 Jacabs Stream",
      "employment": "Self-Employed",
      "date_time": "22-07-2022, 4:00pm",
      "hrs": "4 hours/week",
      "specification": ["Hourly", "Driver Required", "Female", "Pet friendly", "Autism spectrum disorder"],
      "posted_on": "Posted on- 11 Aug 2022",
      "status": [ApplicationStatus.notAccepting, "Not Accepting Applications"],
    },
  ];
}
