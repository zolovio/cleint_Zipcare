import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeScreenController = ref.watch(homeScreenProvider);
    return ListView.builder(
      itemCount: homeScreenController.users.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: index == 0
              ? const EdgeInsets.only(top: 10, left: 12.0, right: 12.0, bottom: 5.0)
              : const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 5.0),
          child: Card(
            elevation: 5,
            shadowColor: shadowColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 70,
                          child: CircleAvatar(
                            child: Image.asset(onboard3),
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
                                homeScreenController.users[index],
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: blackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on_outlined),
                                      Text(
                                        homeScreenController.location[index],
                                        style: GoogleFonts.lexend(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: locationColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${homeScreenController.miles[index]} miles away',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lexend(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: locationColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: ratingColor,
                                  ),
                                  Text(
                                    " ${homeScreenController.ratings[index]} ",
                                    style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: darkGreyColor,
                                    ),
                                  ),
                                  Text(
                                    " Rating",
                                    style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: locationColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Wrap(
                      children: homeScreenController.expertise[index]
                          .map(
                            (expert) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              decoration: const BoxDecoration(
                                color: shadowColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: Text(
                                expert,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "${homeScreenController.experience[index]} years of experience",
                            style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: locationColor,
                            ),
                          ),
                        ),
                        Row(
                          children: const [
                            CircleAvatar(
                              backgroundColor: shadowColor,
                              child: Icon(
                                Icons.messenger_outline,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(width: 3),
                            CircleAvatar(
                              backgroundColor: shadowColor,
                              child: Icon(
                                Icons.favorite_border,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
