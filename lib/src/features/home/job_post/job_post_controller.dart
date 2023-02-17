import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobPostProvider = ChangeNotifierProvider.autoDispose((ref) => JobPostController());

class JobPostController extends ChangeNotifier {
  JobPostController();

  int currentIndex = 1;
  int totalIndices = 5;
  String hoursFormat = "AM";

  bool isSelfEmployed = true;
  bool isRequireUrgently = true;
  bool isCareNeedFor = true;
  bool isAuthorized = true;
  bool isExistingProfile = true;
  bool isRequestedProfile = true;
  bool isCareType = true;
  bool isJobType = true;

  List<String> yesNo = ["Yes", "No"];
  List<String> profile = ["Existing Profile", "New Profile"];
  List<String> eProfiles = ["Profile 1", "Profile 2", "Profile 3", "Profile 4"];
  List<String> requestedProfile = ["Person", "Business"];

  List<String> age = ["1", "2", "3", "4", "5"];
  List<String> gender = ["Male", "Female"];
  List<String> careType = ["Hourly", "Live-in", "Overnight"];
  List<String> jobType = ["One time", "Recurring"];
  List<String> hoursFormatList = ["AM", "PM"];
  List<String> hoursPerWeek = ["1", "2", "3", "4", "5"];

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

  void onAuthorization() {
    isAuthorized = !isAuthorized;
    notifyListeners();
  }

  void onProfileCheck() {
    isExistingProfile = !isExistingProfile;
    notifyListeners();
  }

  void onProfileRequest() {
    isRequestedProfile = !isRequestedProfile;
    notifyListeners();
  }

  void onGenderChange() {}

  void onCareTypeChange() {}

  void onJobTypeChange() {}

  void onHourFormatChange(String format) {
    hoursFormat = format;
    notifyListeners();
  }
}
