import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allocatedProfileProvider = ChangeNotifierProvider.autoDispose((ref) => AllocatedProfileController());

class AllocatedProfileController extends ChangeNotifier {
  AllocatedProfileController();

  int? maxLines = 2;

  bool isReadMore = false;

  Map<String, dynamic> applicantProfile = {
    "detail": "Female Hourly Day Carer Required",
    "status": {"title": "Job Status", "value": "In-Progress"},
    "payroll": {"title": "Payroll Setup Status", "value": "Yes"},
    "profile_img": logo,
    "name": "Mary",
    "job_id": "Job Id: #126565",
    "verified": [
      [jobDetailUser, "Employed", ""],
      [locationBlue, "W2P, London", ""],
      [calenderGreen, "22-07-2022", "4:00pm"],
      [clockRed, "4hr/week", ""],
    ],
    "services": {
      "title": "Service needed",
      "values": ["Cooking", "Medication Prompting", "Hoisting"],
    },
    "conditions": {
      "title": "Conditions",
      "values": ["Conditions", "Learning Disabilities", "Mental Health"],
    },
    "training": {
      "title": "Training",
      "values": ["Fire Safety", "Health and Safety", "First Aid"],
    },
    "language": {
      "title": "Language",
      "values": ["English"],
    },
    "care_type": {
      "title": "Care type and schedule ",
      "values": ["Hourly", "One Time"],
    },
    "gender": {
      "title": "Preference gender",
      "values": ["Female"],
    },
    "things_enjoy": {
      "title": "Things you enjoy",
      "values": ["Reading", "Watching TV", "DIY"],
    },
    "document": {
      "title": "Document",
      "logo": logo,
      "download": "Download",
    },
    "requirements": {
      "title": "Specific requirements",
      "text": "About me is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
          "About me is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
    },
  };

  void onReadMoreText() {
    isReadMore = !isReadMore;
    maxLines = isReadMore ? null : 3;

    notifyListeners();
  }

  void onGenerateContract() {
    navigatorKey.currentState?.pushNamed(AppRouter.generateContract);
    notifyListeners();
  }
}
