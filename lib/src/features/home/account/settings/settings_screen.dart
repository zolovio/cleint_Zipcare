import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/account/settings/settings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsController = ref.watch(settingsProvider);

    return Scaffold(
      appBar: getAppBar(settingsText, true, context),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: settingsController.settingTabs.length,
          itemBuilder: (context, index) => Column(
            children: [
              ListTile(
                onTap: () =>
                    settingsController.onTileTap(settingsController.settingTabs[index]["route"]!),
                contentPadding: EdgeInsets.zero,
                title: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    settingsController.settingTabs[index]["title"]!,
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: blackColor,
                      height: 1.6,
                    ),
                  ),
                ),
                trailing: index == 0
                    ? CupertinoSwitch(
                        activeColor: greenColor,
                        thumbColor: whiteColor,
                        trackColor: Colors.black12,
                        value: settingsController.switchApplicationMode,
                        onChanged: (value) => settingsController.onSwitchApplicationMode(),
                      )
                    : null,
              ),
              const Divider(height: 3, color: hintLightColor),
              if (index == settingsController.settingTabs.length - 1) ...[
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                logoutText,
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
              ],
            ],
          ),
        ),
      ),
    );
  }
}
