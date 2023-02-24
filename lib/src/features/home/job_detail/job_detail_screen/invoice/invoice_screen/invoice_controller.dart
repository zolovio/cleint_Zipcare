import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final invoiceScreenProvider = ChangeNotifierProvider.autoDispose((ref) => InvoiceScreenController());

class InvoiceScreenController extends ChangeNotifier {
  InvoiceScreenController();

  Map<String, dynamic> invoiceDetails = {
    "from": {"title": "From", "name": "Ali Abrahim", "address": "28 Narrowboat Close,\nCoventry,\nCV6 6RD, UK"},
    "to": {"title": "To", "name": "John Watson", "address": "28 Narrowboat Close,\nCoventry,\nCV6 6RD, UK"},
    "no": {"title": "Invoive No.", "no": "INV17307"},
    "job_id": {"title": "Job Id", "id": "126565"},
    "agreement_no": {"title": "Service Agreement No.", "no": "AG20347"},
    "date": {"title": "Invoice Date", "date": "09 July 2022"},
    "address": "28 Narrowboat Close, Coventry, CV6 6RD, UK",
    "invoice": [
      {"title": "#", "value": "1."},
      {"title": "Start date/Time", "value": "10 July 2022 10:00"},
      {"title": "End date/Time", "value": "10 July 2022 14:00"},
      {"title": "Amount", "value": "200 "},
    ],
  };
}
