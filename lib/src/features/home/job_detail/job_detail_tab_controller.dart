import 'package:client_zipcare/src/features/home/job_detail/allocated/allocated_screen.dart';
import 'package:client_zipcare/src/features/home/job_detail/applicants/applicants_screen.dart';
import 'package:client_zipcare/src/features/home/job_detail/job_detail_screen/job_detail_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobDetailTabProvider = ChangeNotifierProvider.autoDispose((ref) => JobDetailTabController());

class JobDetailTabController extends ChangeNotifier {
  JobDetailTabController();

  int selectedIndex = 0;

  final List<Widget> pages = [const JobDetailScreen(), const ApplicantsScreen(), const AllocatedScreen()];

  void onSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
