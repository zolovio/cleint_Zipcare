import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentStatusProvider = ChangeNotifierProvider.autoDispose((ref) => PaymentStatusController());

class PaymentStatusController extends ChangeNotifier {
  PaymentStatusController();

  Map<String, dynamic> paymentDetails = {
    "status": {"title": "Status", "value": "Completed"},
    "date": {"title": "Invoice Date", "value": "June 21, 2022"},
    "transfer_id": {"title": "Transfer Id", "value": "00000000110101"},
    "date_paid": {"title": "Date Paid", "value": "June 21, 2022"},
    "invoice_id": {"title": "Invoice Id", "value": "INV17307"},
    "job_id": {"title": "Job Id", "value": "126565"},
  };
}
