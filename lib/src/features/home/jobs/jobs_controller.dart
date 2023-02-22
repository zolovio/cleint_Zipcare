import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobsProvider = ChangeNotifierProvider.autoDispose((ref) => JobsController());

class JobsController extends ChangeNotifier {
  JobsController();

  int selectedIndex = 0;

  void onSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
