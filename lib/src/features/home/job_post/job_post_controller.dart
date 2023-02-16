import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobPostProvider = ChangeNotifierProvider.autoDispose((ref) => JobPostController());

class JobPostController extends ChangeNotifier {
  JobPostController();

  int currentIndex = 1;
  int totalIndices = 5;

  bool isSelfEmployed = true;
  bool isRequireUrgently = true;
  bool isCareNeedFor = true;
  bool isExistingProfile = true;

  List<String> yesNo = ["Yes", "No"];
  List<String> profile = ["Existing Profile", "New Profile"];

  void updatePageStepper(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onSelfEmployed() {
    isSelfEmployed = !isSelfEmployed;
    notifyListeners();
  }

  void onUrgentRequirement() {
    isRequireUrgently = !isRequireUrgently;
    notifyListeners();
  }

  void onCareNeedFor() {
    isCareNeedFor = !isCareNeedFor;
    notifyListeners();
  }

  void onProfileCheck() {
    isExistingProfile = !isExistingProfile;
    notifyListeners();
  }
}
