import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatWindowProvider = ChangeNotifierProvider.autoDispose((ref) => ChatWindowController());

class ChatWindowController extends ChangeNotifier {
  ChatWindowController();

  List<List<String>> messagesList = [
    ["Thank you for accepting my application. I have sent over the service agreement for approval ", "sender", "16:50"],
    ["I received it and happy to accept.", "receiver", "16:50"],
    ["Great. I have sent over the invoice too. Please send the approval, so that we can start.", "sender", "16:50"],
    ["I have approved the invoice. See you today afternoon.", "receiver", "16:50"],
  ];

  void addMessageToList(String text, String user, String time) {
    messagesList.add([text, user, time]);
    notifyListeners();
  }
}
