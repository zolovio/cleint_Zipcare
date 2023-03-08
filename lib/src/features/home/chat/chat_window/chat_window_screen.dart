// ignore_for_file: must_be_immutable

import 'package:client_zipcare/main.dart';
import 'package:client_zipcare/src/core/components/custom_app_bar.dart';
import 'package:client_zipcare/src/core/configs/app_router.dart';
import 'package:client_zipcare/src/core/constants/colors.dart';
import 'package:client_zipcare/src/core/constants/constants.dart';
import 'package:client_zipcare/src/features/home/chat/chat_window/chat_window_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatWindow extends ConsumerWidget {
  ChatWindow({Key? key, required this.userName}) : super(key: key);

  String userName;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatWindowC = ref.watch(chatWindowProvider);
    if (chatWindowC.messagesList.isEmpty) chatWindowC.getMessagesList();

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
                  backgroundColor: AppColors.greenColor,
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
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Chat(
        messages: chatWindowC.messagesList,
        customBottomWidget: Card(
          elevation: 5,
          shadowColor: AppColors.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
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
                    color: AppColors.blackColor,
                    width: 25,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                FormBuilder(
                  key: _formKey,
                  child: Expanded(
                    child: FormBuilderTextField(
                      name: 'send',
                      decoration: InputDecoration(
                        hintText: "Send Message",
                        hintStyle: const TextStyle(
                          color: AppColors.lighterGreyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        suffixIcon: InkWell(
                          onTap: () => chatWindowC.handleAttachmentPressed(context),
                          child: Image.asset(
                            attachment,
                            width: 25,
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    chatWindowC.handleSendPressed(
                        types.PartialText(text: _formKey.currentState!.fields['send']?.value));
                    _formKey.currentState!.fields['send']?.didChange(null);
                  },
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
        // onAttachmentPressed: chatWindowC.handleFileSelection,
        onMessageTap: chatWindowC.handleMessageTap,
        onPreviewDataFetched: chatWindowC.handlePreviewDataFetched,
        onSendPressed: chatWindowC.handleSendPressed,
        user: chatWindowC.user,
      ),
    );
  }
}
