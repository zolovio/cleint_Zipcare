import 'package:client_zipcare/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

class Indicator extends AnimatedWidget {
  final PageController controller;

  const Indicator({super.key, required this.controller}) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _createIndicator(index, controller);
                })
          ],
        ),
      ),
    );
  }

  Widget _createIndicator(int index, PageController controller) {
    double w = 10;
    double h = 10;
    MaterialColor color = colorGreySwatch;

    if (controller.page == index) {
      color = colorPrimarySwatch;
      h = 13;
      w = 13;
    }

    return SizedBox(
      height: 20,
      width: 20,
      child: Center(
        child: AnimatedContainer(
          width: w,
          height: h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          duration: const Duration(milliseconds: 00),
        ),
      ),
    );
  }
}
