import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allocatedProvider = ChangeNotifierProvider.autoDispose((ref) => AllocatedController());

class AllocatedController extends ChangeNotifier {
  AllocatedController();

  List<List<String>> allocatedPersonList = [
    [
      "Marry",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
    ],
  ];
}
