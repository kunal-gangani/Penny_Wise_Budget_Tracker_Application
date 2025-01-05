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
          icon: Icon(Icons.category_outlined),
          label: "Categories",
        ),
        NavigationDestination(
          icon: Icon(Icons.folder_shared_outlined),
          label: "Category Hub",
        ),
        NavigationDestination(
          icon: Icon(Icons.currency_exchange_outlined),
          label: "Transactions",
        ),
        NavigationDestination(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: "Accounts",
        ),
      ],
    );
  });
}
