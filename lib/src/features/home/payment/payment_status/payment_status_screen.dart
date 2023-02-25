import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/payment/payment_status/payment_status_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentStatusScreen extends ConsumerWidget {
  const PaymentStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusController = ref.watch(paymentStatusProvider);

    return Scaffold(
      appBar: getAppBar(paymentStatusText, true, context),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "JW",
                      style: GoogleFonts.lexend(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Johan Watson",
                        style: GoogleFonts.lexend(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                      Text(
                        "July 10, 2022",
                        style: GoogleFonts.lexend(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor,
                    gradientShade.withOpacity(0.6),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Payment Successfully Done",
                    style: GoogleFonts.lexend(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "£30",
                    style: GoogleFonts.lexend(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(height: 3, color: hintLightColor),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statusController.paymentDetails["status"]["title"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: lightGreyColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          statusController.paymentDetails["status"]["value"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: descGreyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statusController.paymentDetails["transfer_id"]["title"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: lightGreyColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          statusController.paymentDetails["transfer_id"]["value"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: descGreyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statusController.paymentDetails["invoice_id"]["title"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: lightGreyColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          statusController.paymentDetails["invoice_id"]["value"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: descGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statusController.paymentDetails["date"]["title"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: lightGreyColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          statusController.paymentDetails["date"]["value"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: descGreyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statusController.paymentDetails["date_paid"]["title"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: lightGreyColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          statusController.paymentDetails["date_paid"]["value"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: descGreyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statusController.paymentDetails["job_id"]["title"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: lightGreyColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          statusController.paymentDetails["job_id"]["value"],
                          style: GoogleFonts.lexend(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: descGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Image.asset(completed),
          ],
        ),
      ),
    );
  }
}
