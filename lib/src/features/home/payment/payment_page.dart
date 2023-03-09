import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
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
      appBar: getAppBar(context, paymentText, true, true),
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
                    color: AppColors.deepGreyColor,
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
                      color: AppColors.yellowColor,
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
                                borderSide:
                                    BorderSide(color: AppColors.lighterGreyColor.withOpacity(0.4)),
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
                                      color: AppColors.deepGreyColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
                                    child: ListTile(
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.lighterGreyColor.withOpacity(0.4)),
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
                                      color: AppColors.deepGreyColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
                                    child: ListTile(
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.lighterGreyColor.withOpacity(0.4)),
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
                                            color: AppColors.blackColor,
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
                  onPressed: () =>
                      navigatorKey.currentState?.pushNamed(AppRouter.paymentStatusScreen),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkPurpleColor,
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
                                color: AppColors.whiteColor,
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
