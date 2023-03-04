import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myProfileProvider = ChangeNotifierProvider.autoDispose((ref) => MyProfileController());

class MyProfileController extends ChangeNotifier {
  MyProfileController();

  final String username = "John Watson";
  final String email = "Itunuoluwa@petra";

  List<Map<String, dynamic>> profileDetails = [
    {"title": "Phone Number", "value": "+1236548871"},
    {"title": "Funding Type", "value": "NHS"},
    {"title": "Country", "value": "Singapore"},
    {"title": "City", "value": "Malay"},
    {"title": "Address", "value": "635 jacabs streams"},
    {"title": "Postcode", "value": "123664"},
  ];
}
