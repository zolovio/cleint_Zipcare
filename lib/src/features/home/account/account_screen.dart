import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/account/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountController = ref.watch(accountProvider);

    double totalWidth = ((MediaQuery.of(context).size.width / 2) - 15);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      editText,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.lexend(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(logo, width: 120, height: 120),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  myProfileText,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.lexend(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
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
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Only 1 step to go',
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: blackColor,
                        ),
                      ),
                      Text(
                        'Complete Profile',
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Transform.translate(
                        offset: Offset((totalWidth * 1.9 * 0.8) - totalWidth, -5),
                        child: Container(
                          child: Text(
                            "${(0.8 * 100).toStringAsFixed(0)}%",
                            style: GoogleFonts.lexend(
                              fontSize: 12.0,
                              color: blackColor,
                            ),
                          ),
                        ),
                      ),
                      LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        lineHeight: 5,
                        backgroundColor: whiteColor,
                        percent: 0.8,
                        progressColor: primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Complete the steps to increase your chances for bookings.',
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: hintColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: accountController.profileCards.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () =>
                      accountController.onCardTap(accountController.profileCards[index]["page"]!),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            accountController.profileCards[index]["img"]!,
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            accountController.profileCards[index]["title"]!,
                            style: GoogleFonts.lexend(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
