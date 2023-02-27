import 'package:client_zipcare/src/features/home/jobs/approved_jobs/approved_job_screen.dart';
import 'package:client_zipcare/src/features/home/jobs/posted_jobs/posted_job_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobsProvider = ChangeNotifierProvider.autoDispose((ref) => JobsController());

class JobsController extends ChangeNotifier {
  JobsController();

  int selectedIndex = 0;

  final List<Widget> pages = [const PostedJobScreen(), const ApprovedJobScreen()];

  void onSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
