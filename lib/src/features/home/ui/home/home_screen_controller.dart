import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenProvider = ChangeNotifierProvider.autoDispose((ref) => HomeScreenController());

class HomeScreenController extends ChangeNotifier {
  HomeScreenController();

  List<String> users = ["Marry", "Tom", "Kenny", "Marry", "Tom", "Kenny"];
  List<String> location = ["SW11, London", "SW11, London", "SW11, London", "SW11, London", "SW11, London", "SW11, London"];
  List<String> miles = ["7", "2", "15", "7", "2", "15"];
  List<String> ratings = ["4.5", "5.0", "4.5", "4.5", "5.0", "4.5"];
  List<List<String>> expertise = [
    ["COPD", "Mental Health", "Cancer", "Dementia", "Autism spectrum disorder"],
    ["COPD", "Spinal Injuries", "Stroke", "Anxiety", "Huntingdon's disease", "Mental Health"],
    ["COPD", "Eating disorder", "Epilepsy", "Diabetes"],
    ["COPD", "Mental Health", "Cancer", "Dementia", "Autism spectrum disorder"],
    ["COPD", "Spinal Injuries", "Stroke", "Anxiety", "Huntingdon's disease", "Mental Health"],
    ["COPD", "Eating disorder", "Epilepsy", "Diabetes"]
  ];
  List<String> experience = ["5+", "2+", "1+", "5+", "2+", "1+"];
}
