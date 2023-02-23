import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final applicantProfileProvider = ChangeNotifierProvider.autoDispose((ref) => ApplicantProfileController());

class ApplicantProfileController extends ChangeNotifier {
  ApplicantProfileController();

  int? maxLines = 2;

  bool isReadMore = false;

  Map<String, dynamic> applicantProfile = {
    "job_title": "Female Hourly Day Carer Required",
    "profile_img": logo,
    "name": "Itunuoluwa Abidoye",
    "email": "Itunuoluwa@petra",
    "verified": [
      [rating, "4.5 Rating"],
      [insurance, "Insurance"],
      [dbsStatus, "DBS Status"],
      [drivingLicense, "Driving License"],
    ],
    "rates": {
      "title": "Rates",
      "values": [
        {
          "title": "Hourly Need",
          "values": [
            {
              "title": "whole",
              "price": "£80/hr",
            }
          ],
        },
        {
          "title": "Urgent Need",
          "values": [
            {
              "title": "whole",
              "price": "£80/hr",
            }
          ]
        },
        {
          "title": "Overnight",
          "values": [
            {"title": "Sleeping", "price": "£80/hr"},
            {"title": "Waking", "price": "£80/hr"},
          ]
        },
        {
          "title": "Live-In",
          "values": [
            {"title": "Sleeping", "price": "£80/hr"},
            {"title": "Waking", "price": "£80/hr"},
          ]
        }
      ],
    },
    "about": {
      "title": "About Me",
      "text": "About me is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
          "About me is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
    },
    "video": {"title": "Work Video", "link": ""},
    "address": [
      {"title": "Country name", "name": "India"},
      {"title": "City name", "name": "Kochi"},
      {"title": "Language", "name": "Hindi, French, English"},
    ],
    "services": {
      "title": "Services",
      "values": [
        {"title": "Personal care", "value": "2"},
        {"title": "Cleaning", "value": "3"},
        {"title": "Cooking", "value": "2"},
        {"title": "Gardening", "value": "2"},
      ],
    },
    "training": {
      "title": "Training",
      "values": ["Fire Safety", "Health and Safety", "First Aid"],
    },
    "health_condition": {
      "title": "Health Condition and Confidence level",
      "values": [
        {"title": "Cancer", "value": "2"},
        {"title": "Continence/incontinence", "value": "3"},
      ],
    },
    "enjoy": {
      "title": "Things you Enjoy",
      "values": ["DIY", "Watching TV shows and movies", "Video Games"],
    },
    "soft_skill": {
      "title": "Soft Skills you want to Improve",
      "values": ["Communication", "Flexibility & Adaptability"],
    },
    "qualification": {
      "title": "Qualifications",
      "values": ["Entry or Level1"],
    },
    "experience": {"title": "Years of Experience", "value": "9+ Year"},
  };

  void onReadMoreText() {
    isReadMore = !isReadMore;
    maxLines = isReadMore ? null : 3;

    notifyListeners();
  }
}
