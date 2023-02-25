import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_screen/invoice/invoice_screen/invoice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoiceScreen extends ConsumerWidget {
  const InvoiceScreen({Key? key, required this.jobCompleted}) : super(key: key);

  final bool jobCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoiceController = ref.watch(invoiceScreenProvider);

    return Scaffold(
      appBar: getAppBar(invoiceText, true, context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            if (jobCompleted) ...[
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
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          invoiceController.invoiceDetails["expense"]["title"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: blackColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          invoiceController.invoiceDetails["expense"]["value"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          invoiceController.invoiceDetails["cost"]["title"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: blackColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          invoiceController.invoiceDetails["cost"]["value"],
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    invoiceController.invoiceDetails["description"]["title"],
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    invoiceController.invoiceDetails["description"]["value"],
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: hintColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Receipt",
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(receipt, width: 50, height: 50),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          downloadText,
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: cyanColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(receipt, width: 50, height: 50),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          downloadText,
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: cyanColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    invoiceController.invoiceDetails["expenses"]["title"],
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    invoiceController.invoiceDetails["expenses"]["value"],
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Divider(height: 3, color: hintLightColor),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    invoiceController.invoiceDetails["total"]["title"],
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    invoiceController.invoiceDetails["total"]["value"],
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () => navigatorKey.currentState?.pushNamed(AppRouter.paymentScreen),
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
            ] else ...[
              ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: invoiceController.isCancelled
                      ? redColor.withOpacity(.2)
                      : invoiceController.isCompleted
                          ? greenColor.withOpacity(.1)
                          : primaryColor.withOpacity(.2),
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
                            invoiceController.isCancelled
                                ? cancelledText
                                : invoiceController.isCompleted
                                    ? approvedText
                                    : approvalPendingText,
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: invoiceController.isCancelled
                                  ? redColor
                                  : invoiceController.isCompleted
                                      ? greenColor
                                      : primaryColor,
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
              const SizedBox(height: 20),
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
                                    textAlign: TextAlign.center,
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
                                  textAlign: TextAlign.center,
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
              const SizedBox(height: 20),
              if (invoiceController.isCancelled) ...[
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Wrap(
                    children: [
                      Text(
                        "$reasonText : ",
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: descGreyColor,
                        ),
                      ),
                      Text(
                        invoiceController.alertFieldController.text,
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: descGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
              if (invoiceController.isCompleted) ...[
                const Divider(height: 3, color: hintLightColor),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Carer marked this invoice as completed. ",
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: descGreyColor,
                    ),
                  ),
                ),
                const Divider(height: 3, color: hintLightColor),
                const SizedBox(height: 20),
              ],
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: invoiceController.isCancelled
                      ? null
                      : invoiceController.isApproved
                          ? null
                          : !invoiceController.isConfirm
                              ? null
                              : invoiceController.isCompleted
                                  ? () => showDialog<void>(
                                        context: context,
                                        barrierDismissible: false, // user must tap button!
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            titlePadding: const EdgeInsets.all(0.0),
                                            title: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                                  child: GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      alignment: FractionalOffset.topRight,
                                                      child: GestureDetector(
                                                        child: Image.asset(cut),
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(20.0),
                                                  child: Text(
                                                    "Do you want to confirm this invoice?",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.lexend(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 20,
                                                      color: blackColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              const SizedBox(height: 15),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      invoiceController.onApproved();
                                                      navigatorKey.currentState?.pop();
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: primaryColor,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                                      child: Center(
                                                        child: Text(
                                                          yesText,
                                                          style: GoogleFonts.lexend(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 18,
                                                            color: whiteColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      navigatorKey.currentState?.pop();

                                                      showDialogAlert(
                                                        context,
                                                        "Please explain your concern.",
                                                        "Please describe your reason (Required)",
                                                        invoiceController.issueController,
                                                        true,
                                                      );

                                                      invoiceController.onConfirm();
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: redColor,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                                      child: Center(
                                                        child: Text(
                                                          noText,
                                                          style: GoogleFonts.lexend(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 18,
                                                            color: whiteColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 15),
                                            ],
                                          );
                                        },
                                      )
                                  : () {
                                      navigatorKey.currentState?.pushNamed(AppRouter.paymentScreen);
                                      invoiceController.onCompleted();
                                    },
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
                              invoiceController.isApproved
                                  ? jobCompletedText
                                  : invoiceController.isCompleted
                                      ? confirmText
                                      : payText,
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
              const SizedBox(height: 10),
              if (!invoiceController.isCancelled && !invoiceController.isCompleted) ...[
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
                    onPressed: () {
                      showDialogAlert(
                        context,
                        "Do you want to cancel this invoice?",
                        "Please describe your reason (optional)",
                        invoiceController.alertFieldController,
                        true,
                      );
                      invoiceController.onCancel();
                    },
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
              if (invoiceController.isApproved) ...[
                const Divider(height: 3, color: hintLightColor),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    postReviewText,
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: blackColor,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "How was your shift ?",
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: blackColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Image.asset(rating, width: 20, height: 20),
                    onRatingUpdate: (rating) => showRatingDialog(
                      context,
                      saveImage,
                      "Care to share more?",
                      "How was your overall experience?",
                      "rating",
                      invoiceController.issueController,
                      "Do you have any additional comments? \nType here...",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: () => showRatingDialog(
                      context,
                      issue,
                      "Oops ! we are sorry",
                      "Please share your issue below.",
                      "issue",
                      invoiceController.ratingController,
                      "Type here...",
                    ),
                    child: Text(
                      "Report issue",
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: blackColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(height: 3, color: hintLightColor),
                const SizedBox(height: 10),
              ],
              if (!invoiceController.isConfirm) ...[
                Text(
                  "Ticket raised with customer support team, we will get back to you shortly. ",
                  maxLines: 5,
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: redColor,
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
