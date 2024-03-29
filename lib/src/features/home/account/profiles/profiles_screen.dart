import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/account/profiles/profiles_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilesScreen extends ConsumerWidget {
  const ProfilesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileController = ref.watch(profilesProvider);

    return Scaffold(
      appBar: getAppBar(context, profileListText, true, true),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: ListView.builder(
          itemCount: profileController.profilesList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 5.0),
              child: Card(
                elevation: 1,
                shadowColor: AppColors.shadowColor,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 50,
                              child: CircleAvatar(
                                child: Image.asset(logo),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    profileController.profilesList[index]["name"]!,
                                    style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: CircleAvatar(
                              backgroundColor: AppColors.shadowColor,
                              child: Image.asset(profileList),
                            ),
                          ),
                          Expanded(
                            child: CircleAvatar(
                              backgroundColor: AppColors.shadowColor,
                              child: Image.asset(delete),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => profileController.onAddProfile(),
        backgroundColor: AppColors.whiteColor,
        child: Image.asset(addButton),
      ),
    );
  }
}
