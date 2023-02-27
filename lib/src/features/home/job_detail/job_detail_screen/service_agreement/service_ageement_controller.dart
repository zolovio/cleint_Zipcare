import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_screen/invoice/invoice_screen/invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceAgreementProvider = ChangeNotifierProvider.autoDispose((ref) => ServiceAgreementController());

class ServiceAgreementController extends ChangeNotifier {
  ServiceAgreementController();

  bool isEdit = false;
  bool isView = false;
  bool isApproved = false;
  bool isSend = false;

  String contractData = "";

  TextEditingController contractController = TextEditingController(text: "");

  Map<String, dynamic> contractDetails = {
    "title": "Contract between Ali Abrahim  and John Watson",
    "recipient": {"title": "Care recipient name", "name": "Ali Abrahim"},
    "address": {"title": "Care recipient address ", "address": "28 Narrowboat Close, Coventry, CV6 6RD, UK"},
    "begin": {"title": "Employment begin", "date": "22-10-2022"},
    "end": {"title": "Employment end", "date": "22-11-2022"},
    "services": {"title": "Services also include", "services": "Cooking, Medication prompting, Hoisting"},
    "sincere": "Your Sincerely \n John Watson ",
    "contract":
        "www.ZipCare.com is an Online platform for individuals requiring care or their agents and carers, to connect with each other. We do not introduce or supply to those seeking care Dummy text here...... ",
  };

  String contractDetail = "Contract between Ali Abrahim  and John Watson \n \n"
      "Care recipient name : Ali Abrahim \n \n"
      "Care recipient address : 28 Narrowboat Close, Coventry, CV6 6RD, UK \n\n"
      "Employment begin : 22-10-2022 \n"
      "Employment end    : 22-11-2022 \n\n"
      "Services also include : Cooking, Medication prompting, Hoisting \n\n"
      "Your Sincerely \n John Watson \n\n\n"
      "www.ZipCare.com is an Online platform for individuals requiring care or their agents and carers, to connect with each other. We do not introduce or supply to those seeking care Dummy text here......";

  void onEdit() {
    isEdit = !isEdit;
    contractController.text = contractDetail;
    notifyListeners();
  }

  void onApprove() {
    isApproved = !isApproved;
    notifyListeners();
  }

  void onView(String value) {
    isView = !isView;
    isEdit = !isEdit;

    contractData = value;

    notifyListeners();
  }

  void onReset() {
    contractController.text = contractDetail;
    contractData = contractDetail;

    notifyListeners();
  }

  void onSend() {
    isSend = !isSend;

    isEdit = false;
    isView = false;
    isApproved = false;

    notifyListeners();
  }

  void onSendNav(bool contract) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => InvoiceScreen(jobCompleted: false, isContract: contract),
      ),
    );
  }
}
