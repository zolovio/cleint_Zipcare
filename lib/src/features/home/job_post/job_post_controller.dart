import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum QuesType { text, radio, checkbox }

final jobPostProvider = ChangeNotifierProvider.autoDispose((ref) => JobPostController());

class JobPostController extends ChangeNotifier {
  JobPostController();

  int currentIndex = 1;
  int totalIndices = 5;
  int? maxLines = 2;

  String dateFormat = "18-feb-2023";
  String timeFormat = "4:00";
  String hoursFormat = "AM";
  String noOfHours = "4hrs";

  String userName = "John Watson";
  String jobId = "Job Id: #126565";
  String requirementsText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
      "Lorem Ipsum has been the industry's standard dummy text ever since the1500s."
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
      "Lorem Ipsum has been the industry's standard dummy text ever since the1500s.";

  bool isSelfEmployed = true;
  bool isRequireUrgently = true;
  bool isCareNeedFor = true;
  bool isAuthorized = true;
  bool isExistingProfile = true;
  bool isRequestedProfile = true;
  bool isCareType = true;
  bool isJobType = true;
  bool isFunding = true;
  bool isCarePlan = true;
  bool isReadMore = false;
  bool multiPick = false;

  List<PlatformFile>? _paths;
  String? directoryPath;
  String? extension;
  FileType pickingType = FileType.custom;
  String? fileName = "Upload Document";

  List healthConditionsSelected = [];
  List serviceRequiredSelected = [];
  List thingEnjoySelected = [];
  List languageSpeakSelected = [];

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

  List<String> healthConditions = [
    "Accident rehabilitation",
    "Anxiety",
    "Autism spectrum disorder",
    "Cancer",
    "Catheter care",
    "Continence/incontinence",
    "Depression",
    "Down's syndrome",
    "Eating disorders",
    "Huntington's disease",
    "Learning disabilities",
    "Mental health",
    "Multiple sclerosis",
    "Occupational therapy",
    "Palliative care",
    "PEG feeding",
    "Physical disabilities (children)",
    "Respiratory conditions",
    "Self-harm",
    "Stoma care",
    "Tourette's syndrome",
    "Anaphylaxis",
    "Arthritis",
    "Bipolar disorder",
    "Brain injuries",
    "Cerebral palsy",
    "Dementia",
    "Depression",
    "Diabetes",
    "Dysphagia",
    "Epilepsy",
    "Incontinence",
    "Long covid",
    "Motor neurone disease",
    "Obsessive compulsive disorder",
    "Orthopaedic injuries",
    "Parkinson's disease",
    "Physical disabilities",
    "Physiotherapy",
    "Schizophrenia",
    "Spinal injuries",
    "Stroke",
    "Visual and hearing impairments",
  ];

  List<String> listServiceRequiredFor = [
    "Administration",
    "Cleaning",
    "Cooking",
    "Eating and drinking assistance",
    "Housekeeping",
    "Medication prompting",
    "Gardening",
    "Hoisting",
    "Looking after pets",
    "Medication prompting",
    "Personal care",
    "Transportation",
    "Companionship",
  ];

  List<String> listThingsYouEnjoy = [
    "Watching TV shows and movies",
    "Reading",
    "Working out",
    "Arts and Crafts",
    "Board Games",
    "DIY",
    "Yoga",
    "Baking",
    "Gardening",
    "Video games",
    "Meditation",
    "Audio Books and podcasts",
    "Writing",
    "Learning Language",
    "Learning an Instrument",
  ];

  List<String> listLanguagesSpeak = ["English", "Spanish", "Japanese", "Turkish", "Hindi"];

  List<String> listFundingType = ["Fund type 1", "Fund type 2", "Fund type 3", "Fund type 4", "Fund type 5"];

  List<List<String>> profileUserDetails = [
    [jobDetailUser, "53 year", ""],
    [locationBlue, "W2P, London", ""],
    [calenderGreen, "22-07-2022", "4:00pm"],
  ];

  List<Map<String, dynamic>> jobPostQuestions = [
    {"question": "Is this a self-employed position?", "description": "", "type": QuesType.radio},
    {
      "question": "Is it an urgent requirement/ needs matching?",
      "description":
          "Please note that we are unable to provide matching service for employed positions. Click here for more information about our matching service.",
      "type": QuesType.radio
    },
    {"question": "Are you the person needing care?", "description": "", "type": QuesType.radio},
  ];

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

  void onDateFormatChange(String format) {
    dateFormat = format;
    notifyListeners();
  }

  void onTimeChange(String format) {
    timeFormat = format;
    notifyListeners();
  }

  void onHourFormatChange(String format) {
    hoursFormat = format;
    notifyListeners();
  }

  void onHoursNoChange(String num) {
    noOfHours = num;
    notifyListeners();
  }

  void onFundingChange() {
    isFunding = !isFunding;
    notifyListeners();
  }

  void onCarePlanChange() {
    isCarePlan = !isCarePlan;
    notifyListeners();
  }

  void pickFiles() async {
    try {
      directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: multiPick,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: ['doc', 'pdf'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      print(e);
    }

    String fName = _paths != null ? _paths!.map((e) => e.name).toString() : '...';

    fileName = fName.substring(1, fName.length - 1);
    notifyListeners();
  }

  void onHealthConditionCheck(List selectedVal) {
    healthConditionsSelected = [];
    healthConditionsSelected = selectedVal;
    notifyListeners();
  }

  void onServiceRequireCheck(List selectedVal) {
    serviceRequiredSelected = [];
    serviceRequiredSelected = selectedVal;
    notifyListeners();
  }

  void onThingsEnjoyCheck(List selectedVal) {
    thingEnjoySelected = [];
    thingEnjoySelected = selectedVal;
    notifyListeners();
  }

  void onLanguageSpeakCheck(List selectedVal) {
    languageSpeakSelected = [];
    languageSpeakSelected = selectedVal;
    notifyListeners();
  }

  void onReadMoreText() {
    isReadMore = !isReadMore;
    maxLines = isReadMore ? null : 3;

    notifyListeners();
  }
}
