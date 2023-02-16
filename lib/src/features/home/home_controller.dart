import 'package:client_zipcare/src/features/home/chat/chat_screen.dart';
import 'package:client_zipcare/src/features/home/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider.autoDispose((ref) => HomeController());

enum NavBarItems { home, jobs, chat, account }

class HomeController extends ChangeNotifier {
  HomeController();

  int currentIndex = 0;

  final List<Widget> pages = [const HomeScreen(), const Text('jobs'), const ChatScreen(), const Text('account')];

  void onTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
