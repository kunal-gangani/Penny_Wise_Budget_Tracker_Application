import 'package:budget_tracker_app/Controllers/navigation_controller.dart';
import 'package:budget_tracker_app/Views/HomePage/Widgets/PageViews/all_categories_component.dart';
import 'package:budget_tracker_app/Views/HomePage/Widgets/PageViews/all_spendings_component.dart';
import 'package:budget_tracker_app/Views/HomePage/Widgets/PageViews/categories_component.dart';
import 'package:budget_tracker_app/Views/HomePage/Widgets/PageViews/spendings.dart';
import 'package:budget_tracker_app/Views/HomePage/Widgets/drawer.dart';
import 'package:budget_tracker_app/Views/HomePage/Widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController navigation = Get.put(
      NavigationController(),
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      drawer: customDrawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Welcome to PennyWise',
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: PageView(
        controller: navigation.pageController,
        onPageChanged: (value) => navigation.changePageView(
          index: value,
        ),
        children: [
          CategoriesComponent(),
          AllCategoriesComponent(),
          const spendingsComponent(),
          const AllSpendingsComponent(),
        ],
      ),
      bottomNavigationBar: navBar(
        controller: navigation,
      ),
    );
  }
}
