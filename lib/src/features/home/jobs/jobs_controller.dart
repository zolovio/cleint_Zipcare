import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobsProvider = ChangeNotifierProvider.autoDispose((ref) => JobsController());

class JobsController extends ChangeNotifier {
  JobsController();

  int selectedIndex = 0;

  Color unSelectedColor = lightGreyColor;

  void onSelectedIndex(int index) {
    selectedIndex = index;
    unSelectedColor = lightGreyColor;

    notifyListeners();
  }
}
