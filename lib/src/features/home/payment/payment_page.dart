import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentController = ref.watch(paymentProvider);

    return Scaffold(
      appBar: getAppBar(paymentText, true, context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  paymentMethodText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lexend(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: darkGreyColor,
                  ),
                ),
                InkWell(
                  onTap: () => navigatorKey.currentState?.pushNamed(AppRouter.addCardScreen),
                  child: Text(
                    addNewCardText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lexend(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: ratingColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: paymentController.paymentMethodsList
                  .map(
                    (paymentList) => paymentList[2] == "pay"
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                            child: ListTile(
                              shape: OutlineInputBorder(
                                borderSide: BorderSide(color: hintLightColor.withOpacity(0.4)),
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                              leading: Image.asset(paymentList[0]),
                              title: Text(
                                paymentList[1],
                                style: GoogleFonts.lexend(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: const Icon(Icons.circle_outlined),
                            ),
                          )
                        : paymentList[2] == "debit"
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  Text(
                                    payWithCardText,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lexend(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: darkGreyColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
                                    child: ListTile(
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(color: hintLightColor.withOpacity(0.4)),
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      ),
                                      leading: Image.asset(paymentList[0], width: 20, height: 20),
                                      title: Text(
                                        paymentList[1],
                                        style: GoogleFonts.lexend(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      trailing: const Icon(Icons.circle_outlined),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  Text(
                                    payWithCardText,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lexend(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: darkGreyColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
                                    child: ListTile(
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(color: hintLightColor.withOpacity(0.4)),
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      ),
                                      leading: Image.asset(paymentList[0], width: 20, height: 20),
                                      title: Text(
                                        paymentList[1],
                                        style: GoogleFonts.lexend(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton.icon(
                                        onPressed: () {},
                                        icon: Image.asset(add),
                                        label: Text(
                                          addCouponText,
                                          style: GoogleFonts.lexend(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: blackColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                            child: Text(
                              nextText,
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Image.asset(next),
                    ],
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
