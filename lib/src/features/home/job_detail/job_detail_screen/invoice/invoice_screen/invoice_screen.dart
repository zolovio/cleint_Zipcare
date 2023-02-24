import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_screen/invoice/invoice_screen/invoice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoiceScreen extends ConsumerWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoiceController = ref.watch(invoiceScreenProvider);

    return Scaffold(
      appBar: getAppBar(invoiceText, true, context),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: primaryColor.withOpacity(.2),
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          approvalPendingText,
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          invoiceController.invoiceDetails["from"]["title"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          " : ",
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          invoiceController.invoiceDetails["from"]["name"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          invoiceController.invoiceDetails["from"]["address"],
                          maxLines: 5,
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: hintColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          invoiceController.invoiceDetails["to"]["title"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          " : ",
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          invoiceController.invoiceDetails["to"]["name"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          invoiceController.invoiceDetails["to"]["address"],
                          maxLines: 5,
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: hintColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(height: 3, color: hintLightColor),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  invoiceController.invoiceDetails["no"]["title"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: blackColor,
                  ),
                ),
                Text(
                  invoiceController.invoiceDetails["no"]["no"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  invoiceController.invoiceDetails["job_id"]["title"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: blackColor,
                  ),
                ),
                Text(
                  invoiceController.invoiceDetails["job_id"]["id"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  invoiceController.invoiceDetails["agreement_no"]["title"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: blackColor,
                  ),
                ),
                Text(
                  invoiceController.invoiceDetails["agreement_no"]["no"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  invoiceController.invoiceDetails["date"]["title"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: blackColor,
                  ),
                ),
                Text(
                  invoiceController.invoiceDetails["date"]["date"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(height: 3, color: hintLightColor),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "Care Recipient : ",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: blackColor,
                  ),
                ),
                Text(
                  invoiceController.invoiceDetails["to"]["name"],
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              invoiceController.invoiceDetails["address"],
              style: GoogleFonts.lexend(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: hintColor,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(5),
              color: shadowColor,
              child: Table(
                border: const TableBorder(
                  verticalInside: BorderSide(
                    width: 1,
                    color: lightGreyColor,
                    style: BorderStyle.solid,
                  ),
                ),
                columnWidths: const {0: FixedColumnWidth(30), 3: FixedColumnWidth(70)},
                children: [
                  TableRow(
                    decoration: const BoxDecoration(color: shadowColor),
                    children: invoiceController.invoiceDetails["invoice"]
                        .map<Widget>(
                          (invoice) => TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  invoice["title"],
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: descGreyColor,
                                  ),
                                ),
                              )),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Table(
                border: const TableBorder(
                  verticalInside: BorderSide(
                    width: 1,
                    color: Colors.blue,
                    style: BorderStyle.solid,
                  ),
                ),
                columnWidths: const {0: FixedColumnWidth(30), 3: FixedColumnWidth(70)},
                children: [
                  TableRow(
                    children: invoiceController.invoiceDetails["invoice"]
                        .map<Widget>(
                          (invoice) => TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                invoice["value"],
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            Container(
              padding: const EdgeInsets.all(5),
              color: shadowColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total",
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "£ 200",
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: primaryColor.withOpacity(.5),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            payText,
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                const Expanded(child: Divider()),
                Text(
                  "OR",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: hintColor,
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: redColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: Text(
                  cancelText,
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: redColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
