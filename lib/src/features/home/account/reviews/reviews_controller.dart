import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewProvider = ChangeNotifierProvider.autoDispose((ref) => ReviewController());

class ReviewController extends ChangeNotifier {
  ReviewController();

  Map<String, dynamic> reviews = {
    "rating": 4.0,
    "review_count": 23,
    "reviews": [
      {
        "name": "John Watson",
        "time": "1 days ago",
        "rating": 5.0,
        "review":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      },
      {
        "name": "John Watson",
        "time": "4 days ago",
        "rating": 4.0,
        "review":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      },
      {
        "name": "John Watson",
        "time": "1 month ago",
        "rating": 5.0,
        "review":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      },
      {
        "name": "John Watson",
        "time": "1 month ago",
        "rating": 5.0,
        "review":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      },
      {
        "name": "John Watson",
        "time": "1 month ago",
        "rating": 5.0,
        "review":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      },
      {
        "name": "John Watson",
        "time": "1 month ago",
        "rating": 5.0,
        "review":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      },
    ],
  };
}
