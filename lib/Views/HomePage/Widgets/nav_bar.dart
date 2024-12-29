import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/navigation_controller.dart';

Widget navBar({required NavigationController controller}) {
  return Obx(() {
    return NavigationBar(
      selectedIndex: controller.selectedIndex.value,
      onDestinationSelected: (index) => controller.changePageView(index: index),
      backgroundColor: Colors.lightGreen,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.category),
          label: "Category",
        ),
        NavigationDestination(
          icon: Icon(Icons.receipt_long),
          label: "All Category",
        ),
        NavigationDestination(
          icon: Icon(Icons.attach_money),
          label: "Spending",
        ),
        NavigationDestination(
          icon: Icon(Icons.payments),
          label: "All Spending",
        ),
      ],
    );
  });
}
