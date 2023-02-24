import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final invoiceListProvider = ChangeNotifierProvider.autoDispose((ref) => InvoiceListController());

class InvoiceListController extends ChangeNotifier {
  InvoiceListController();

  String invoiceForUser = "Invoices for John Watson";
  String jobID = "Job Id: 126565";

  List<Map<String, dynamic>> invoices = [
    {"invoice": "INV17307", "date": "02/08/2022", "price": "+ £30", "status": "Completed"},
    {"invoice": "INV17307", "date": "02/08/2022", "price": "+ £30", "status": "Pending"},
    {"invoice": "INV17307", "date": "02/08/2022", "price": "+ £30", "status": "Completed"},
    {"invoice": "INV17307", "date": "02/08/2022", "price": "+ £30", "status": "Pending"},
    {"invoice": "INV17307", "date": "02/08/2022", "price": "+ £30", "status": "Cancelled"},
  ];
}
