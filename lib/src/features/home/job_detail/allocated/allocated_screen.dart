import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/job_detail/allocated/allocated_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AllocatedScreen extends ConsumerWidget {
  const AllocatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allocatedController = ref.watch(allocatedProvider);

    return ListView.builder(
      itemCount: allocatedController.allocatedPersonList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => allocatedController.onTap(),
          child: Padding(
            padding: index == 0
                ? const EdgeInsets.only(top: 10, left: 12.0, right: 12.0, bottom: 15.0)
                : const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 15.0),
            child: Card(
              elevation: 5,
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
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
                              child: Image.asset(logo),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  allocatedController.allocatedPersonList[index][0],
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                                child: Text(
                                  allocatedController.allocatedPersonList[index][1],
                                  maxLines: 2,
                                  style: GoogleFonts.lexend(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: lightGreyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: CircleAvatar(
                            backgroundColor: shadowColor,
                            child: Image.asset(message),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
