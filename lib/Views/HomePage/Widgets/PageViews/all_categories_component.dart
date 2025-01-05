import 'package:budget_tracker_app/Controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategoriesComponent extends StatelessWidget {
  const AllCategoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller) {
          if (controller.allCategories.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.folder_open,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "No categories selected",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.allCategories.length,
            itemBuilder: (context, index) {
              final category = controller.allCategories[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadowColor: Colors.black,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color(
                      category.categoryColor,
                    ),
                    child: Icon(
                      controller.iconMap[category.categoryIconCode],
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    category.categoryLabel,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    category.categoryName,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.teal,
                  ),
                  onTap: () {},
                ),
              );
            },
          );
        },
      ),
    );
  }
}
