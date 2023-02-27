import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/features/home/job_detail/allocated/allocated_profile/allocated_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allocatedProvider = ChangeNotifierProvider.autoDispose((ref) => AllocatedController());

class AllocatedController extends ChangeNotifier {
  AllocatedController();

  List<List<String>> allocatedPersonList = [
    [
      "Marry",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
    ],
  ];

  void onTap() {
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) => const AllocatedProfile(isApproved: false)));
  }
}
