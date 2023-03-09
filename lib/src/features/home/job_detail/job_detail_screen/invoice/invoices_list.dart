import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_screen/invoice/invoice_list_controller.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_screen/invoice/invoice_screen/invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoicesList extends ConsumerWidget {
  const InvoicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoiceController = ref.watch(invoiceListProvider);

    return Scaffold(
      appBar: getAppBar(context, invoicesText, true, true),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
          itemCount: invoiceController.invoices.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                if (index == 0) ...[
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        invoiceController.invoiceForUser,
                        style: GoogleFonts.lexend(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),
                      Text(
                        invoiceController.jobID,
                        style: GoogleFonts.lexend(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                ],
                InkWell(
                  onTap: () => navigatorKey.currentState?.push(
                    MaterialPageRoute(
                      builder: (_) => const InvoiceScreen(jobCompleted: false, isContract: false),
                    ),
                  ),
                  child: Card(
                    elevation: 5,
                    shadowColor: AppColors.shadowColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.avatarColor,
                                  ),
                                  child: Text(
                                    (index + 1).toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        invoiceController.invoices[index]["invoice"],
                                        style: GoogleFonts.lexend(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                                      child: Text(
                                        invoiceController.invoices[index]["date"],
                                        maxLines: 2,
                                        style: GoogleFonts.lexend(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: AppColors.greyColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        invoiceController.invoices[index]["price"],
                                        style: GoogleFonts.lexend(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: AppColors.deepGreenColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          invoiceController.invoices[index]["status"],
                                          maxLines: 2,
                                          style: GoogleFonts.lexend(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                            color: invoiceController.invoices[index]["status"] ==
                                                    "Completed"
                                                ? AppColors.deepGreenColor
                                                : invoiceController.invoices[index]["status"] ==
                                                        "Pending"
                                                    ? AppColors.yellowColor
                                                    : AppColors.redColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
