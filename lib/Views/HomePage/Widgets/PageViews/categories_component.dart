import 'package:budget_tracker_app/Controllers/category_controller.dart';
import 'package:budget_tracker_app/Views/HomePage/Icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesComponent extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CategoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController value = Get.put(CategoryController());

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Explore Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller,
              validator: (val) =>
                  val!.isEmpty ? "Oops, this field is required.." : null,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'Mention Category',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.lightGreen,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Stack(
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: categoryData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          value.assignIndexToIcon(index: index);
                        },
                        child: GetBuilder<CategoryController>(
                          builder: (controller) {
                            final iconCode = categoryData[index]['icon'];
                            final iconData = value.iconMap[iconCode];

                            return categoryItems(
                              iconData: iconData!,
                              label: categoryData[index]['label'],
                              bgColor: categoryData[index]['color'],
                              isSelected: controller.selectedIndex == index,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: FloatingActionButton(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.lightGreen.shade700,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final selectedIconCode =
                              categoryData[value.selectedIndex!]['icon'];
                          value.insertData(
                            title: controller.text,
                            label: categoryData[value.selectedIndex!]['label'],
                            iconCode: selectedIconCode,
                            colorValue: categoryData[value.selectedIndex!]
                                    ['color']
                                .value,
                          );
                          controller.clear();
                        }
                      },
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget categoryItems({
  required IconData iconData,
  required String label,
  required Color bgColor,
  required bool isSelected,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isSelected ? 70 : 60,
        width: isSelected ? 70 : 60,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.transparent,
            width: isSelected ? 3 : 1,
          ),
        ),
        child: Icon(
          iconData,
          color: Colors.white,
          size: isSelected ? 32 : 28,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
