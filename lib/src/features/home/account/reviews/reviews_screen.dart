import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/account/reviews/reviews_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewsScreen extends ConsumerWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewController = ref.watch(reviewProvider);

    return Scaffold(
      appBar: getAppBar(myReviewText, true, context),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  reviewController.reviews["rating"].toString(),
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: RatingBar.builder(
                    initialRating: reviewController.reviews["rating"],
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                    itemSize: 20,
                    unratedColor: hintLightColor,
                    itemBuilder: (context, _) => Image.asset(rating, width: 10, height: 10),
                    onRatingUpdate: (double value) {},
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Based on ${reviewController.reviews["review_count"]} reviews",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: hintColor,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: reviewController.reviews["reviews"]
                      .map<Widget>(
                        (review) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Image.asset(logo, height: 70),
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  review["name"],
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RatingBar.builder(
                                    initialRating: review["rating"],
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                                    itemSize: 15,
                                    unratedColor: hintLightColor,
                                    itemBuilder: (context, _) =>
                                        Image.asset(rating, width: 10, height: 10),
                                    onRatingUpdate: (double value) {},
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    review["rating"].toString(),
                                    style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: blackColor,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Text(
                                  review["time"],
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: hintColor,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                review["review"],
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: hintColor,
                                  height: 1.6,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      )
                      .toList(),
                ),
                // Column(
                //   children: reviewController.reviews["reviews"]
                //       .map<Widget>(
                //         (review) => Column(
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Row(
                //                   children: [
                //                     Image.asset(
                //                       logo,
                //                       height: 60,
                //                     ),
                //                     SizedBox(width: 10),
                //                     Column(
                //                       crossAxisAlignment: CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           review["name"],
                //                           style: GoogleFonts.lexend(
                //                             fontWeight: FontWeight.w500,
                //                             fontSize: 15,
                //                             color: blackColor,
                //                           ),
                //                         ),
                //                         Row(
                //                           children: [
                //                             RatingBar.builder(
                //                               initialRating: review["rating"],
                //                               minRating: 1,
                //                               direction: Axis.horizontal,
                //                               allowHalfRating: true,
                //                               itemCount: 5,
                //                               itemPadding:
                //                                   const EdgeInsets.symmetric(horizontal: 2),
                //                               itemSize: 20,
                //                               unratedColor: hintLightColor,
                //                               itemBuilder: (context, _) =>
                //                                   Image.asset(rating, width: 10, height: 10),
                //                               onRatingUpdate: (double value) {},
                //                             ),
                //                             Text(
                //                               review["rating"].toString(),
                //                               style: GoogleFonts.lexend(
                //                                 fontWeight: FontWeight.w400,
                //                                 fontSize: 16,
                //                                 color: hintColor,
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //                 Text(
                //                   review["time"],
                //                   style: GoogleFonts.lexend(
                //                     fontWeight: FontWeight.w400,
                //                     fontSize: 12,
                //                     color: hintColor,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Text(
                //               review["review"],
                //               style: GoogleFonts.lexend(
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 16,
                //                 color: hintColor,
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
                //       .toList(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
