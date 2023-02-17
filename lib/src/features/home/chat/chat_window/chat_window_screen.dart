// ignore_for_file: must_be_immutable

import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/components/custom_widgets.dart';
import 'package:client_zipcare/src/features/home/chat/chat_window/chat_window_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatWindow extends ConsumerWidget {
  ChatWindow({Key? key, required this.userName}) : super(key: key);

  String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatWindowC = ref.watch(chatWindowProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            getAppBar(userName, true, context),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton(
                onPressed: () => navigatorKey.currentState?.pushNamed(AppRouter.jobPostScreen),
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    createJob,
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: chatWindowC.messagesList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                alignment: Alignment.bottomCenter,
                child: Align(
                  alignment: (chatWindowC.messagesList[index][1] == "receiver" ? Alignment.topLeft : Alignment.topRight),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(15),
                        topLeft: const Radius.circular(15),
                        bottomLeft: Radius.circular(chatWindowC.messagesList[index][1] == "receiver" ? 0 : 15),
                        bottomRight: Radius.circular(chatWindowC.messagesList[index][1] == "receiver" ? 15 : 0),
                      ),
                      color: (chatWindowC.messagesList[index][1] == "receiver" ? shadowColor : primaryColor),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chatWindowC.messagesList[index][0],
                          style: GoogleFonts.lexend(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: chatWindowC.messagesList[index][1] == "receiver" ? blackColor : whiteColor,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: chatWindowC.messagesList[index][1] == "receiver" ? MainAxisAlignment.start : MainAxisAlignment.end,
                          children: [
                            Text(
                              chatWindowC.messagesList[index][2],
                              style: GoogleFonts.lexend(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: chatWindowC.messagesList[index][1] == "receiver" ? hintColor : shadowColor,
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Card(
              elevation: 5,
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        chatSmiley,
                        color: blackColor,
                        width: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                        name: 'send',
                        decoration: InputDecoration(
                          hintText: "Send Message",
                          hintStyle: const TextStyle(
                            color: hintLightColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          suffixIcon: Image.asset(
                            attachment,
                            width: 25,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () => chatWindowC.addMessageToList("text", "sender", "16:50"),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Image.asset(sendMsg),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
