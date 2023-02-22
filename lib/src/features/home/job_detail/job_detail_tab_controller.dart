import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobDetailTabProvider = ChangeNotifierProvider.autoDispose((ref) => JobDetailTabController());

class JobDetailTabController extends ChangeNotifier {
  JobDetailTabController();

  int selectedIndex = 0;

  List<Map<String, dynamic>> jobDetails = [
    {"ques": "Carer allocation status", "ans": "Yes"},
  ];

  void onSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
