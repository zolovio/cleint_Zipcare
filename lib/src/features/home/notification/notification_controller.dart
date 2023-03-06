import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationProvider = ChangeNotifierProvider.autoDispose((ref) => NotificationController());

class NotificationController extends ChangeNotifier {
  NotificationController();

  final List<String> filterItems = ['All', 'Read', 'Unread'];

  String selectedFilter = 'All';

  List<Map<String, dynamic>> notificationsList = [
    {
      "img": profileImg2,
      "title": "Lex Murphy requested to female hourly day care request",
      "time": "Today at 9:42 AM",
      "type": "button",
    },
    {
      "img": profileImg2,
      "title": "Lex Murphy requested to female hourly day care request",
      "time": "Today at 9:42 AM",
      "type": "button",
    },
    {
      "img": profileImg2,
      "title": "Female Hourly Day carer required.",
      "time": "Yesterday at 11:42 PM",
      "type": "none",
    },
    {
      "img": profileImg1,
      "title": "John Watson commented on your profile",
      "time": "Yesterday at 11:42 PM",
      "type": "comment",
      "comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor "
          "incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud "
          "exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    },
  ];

  onFilterSelected(String value) {
    selectedFilter = value;
    notifyListeners();
  }
}
