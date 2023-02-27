import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_screen/service_agreement/service_agreement_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final generateContractProvider = ChangeNotifierProvider.autoDispose((ref) => GenerateContractController());

class GenerateContractController extends ChangeNotifier {
  GenerateContractController();

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  bool isEmployContract = true;

  List<String> yesNo = ["Yes", "No"];

  void onEmployContract() {
    isEmployContract = !isEmployContract;
    notifyListeners();
  }

  void onGenerateContract() {
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) => const ServiceAgreement(isContract: true)));
  }
}
