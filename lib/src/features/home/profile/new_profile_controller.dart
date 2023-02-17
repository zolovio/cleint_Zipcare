import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newProfileProvider = ChangeNotifierProvider.autoDispose((ref) => NewProfileController());

class NewProfileController extends ChangeNotifier {
  NewProfileController();

  List<String> age = ["1", "2", "3", "4", "5"];
  List<String> gender = ["Male", "Female"];

  void onGenderChange() {}
}
