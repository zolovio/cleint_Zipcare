import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ApplicantsStatus { shortlisted }

final applicantsProvider = ChangeNotifierProvider.autoDispose((ref) => ApplicantsController());

class ApplicantsController extends ChangeNotifier {
  ApplicantsController();

  List<List<String>> chatsList = [
    [
      "Marry",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      "Shortlisted"
    ],
    ["Kiran", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", ""],
    ["Tom", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", ""],
    ["Kenny", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", ""],
    ["Kiran", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", ""],
    ["Kiran", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", ""],
  ];

  void onProfileView() {
    navigatorKey.currentState?.pushNamed(AppRouter.applicantProfile);
  }
}
