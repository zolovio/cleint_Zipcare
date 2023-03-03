import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profilesProvider = ChangeNotifierProvider.autoDispose((ref) => ProfilesController());

class ProfilesController extends ChangeNotifier {
  ProfilesController();

  List<Map<String, String>> profilesList = [
    {"name": "Mary", "img": logo},
    {"name": "John Watson", "img": logo},
    {"name": "Kiran", "img": logo},
    {"name": "Tom", "img": logo},
    {"name": "Kenny", "img": logo},
    {"name": "Kenny", "img": logo},
    {"name": "Kenny", "img": logo},
  ];

  onAddProfile() {
    navigatorKey.currentState?.pushNamed(AppRouter.addNewProfile);
  }
}
