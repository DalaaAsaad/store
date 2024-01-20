import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/enums/bottom_navigation_enum.dart';

class mainViewController extends GetxController {
  PageController pageController = PageController(initialPage: 1);
  Rx<BottomNavigationEnum> selectedView =
      Rx<BottomNavigationEnum>(BottomNavigationEnum.HOME);

  void jumpToPage(BottomNavigationEnum selectEnum, int index) {
    pageController.jumpToPage(
      index,
    );
  }
}
