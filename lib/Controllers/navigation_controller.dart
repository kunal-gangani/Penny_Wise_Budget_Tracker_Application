import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  void changePageView({required int index}) {
    selectedIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeInOut,
    );
  }

  void changeNavigation({required int index}) {
    selectedIndex.value = index;
  }
}
