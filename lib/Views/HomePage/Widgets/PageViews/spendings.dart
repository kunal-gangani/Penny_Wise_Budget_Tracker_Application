import 'package:budget_tracker_app/Controllers/transaction_controllers.dart';
import 'package:budget_tracker_app/Controllers/category_controller.dart';
import 'package:budget_tracker_app/Model/spendings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpendingsComponent extends StatelessWidget {
  SpendingsComponent({super.key});

  final TransactionControllers transactionController =
      Get.put(TransactionControllers());
  final CategoryController categoryController = Get.put(CategoryController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static const headerStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const mainHeaderStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const summaryStyle = TextStyle(
    fontSize: 18,
    color: Colors.black54,
  );

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    transactionController.fetchTransactions();

    return Obx(() {
      final totalBudget = transactionController.totalBudget.value;

      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (transactionController.totalBudget.value == 0)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Set Total Budget',
                        style: mainHeaderStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: budgetController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter your total budget",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(
                            Icons.attach_money,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        validator: (val) =>
                            val!.isEmpty ? "Please enter a budget" : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (budgetController.text.isNotEmpty) {
                              double budget =
                                  double.parse(budgetController.text);
                              transactionController.setTotalBudget(budget);
                              budgetController.clear();
                            } else {
                              Get.snackbar(
                                "Error",
                                "Please enter a valid budget",
                                backgroundColor: Colors.red.shade300,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Set Budget",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Budget Summary',
                  style: headerStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 275,
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const Text(
                                'Total Budget',
                                style: summaryStyle,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$${transactionController.totalBudget.value}',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Remaining Budget',
                                style: summaryStyle,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$${transactionController.remainingBudget.value}',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: transactionController
                                              .remainingBudget.value >=
                                          0
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Add Transaction',
                  style: headerStyle,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: titleController,
                  validator: (val) =>
                      val!.isEmpty ? "Please enter a title" : null,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.title,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  validator: (val) =>
                      val!.isEmpty ? "Please enter an amount" : null,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.money,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Transaction Type:",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Obx(() => Radio<String>(
                          value: "expense",
                          groupValue: transactionController
                              .selectedTransactionType.value,
                          onChanged: (value) {
                            transactionController.setTransactionType(value!);
                          },
                        )),
                    const Text(
                      "Expense",
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Obx(
                      () => Radio<String>(
                        value: "income",
                        groupValue:
                            transactionController.selectedTransactionType.value,
                        onChanged: (value) {
                          transactionController.setTransactionType(value!);
                        },
                      ),
                    ),
                    const Text(
                      "Income",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Date: ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2026),
                        );
                        transactionController.setDate(date);
                      },
                      icon: const Icon(
                        Icons.date_range,
                      ),
                    ),
                    Text(
                      transactionController.selectedDate.value != null
                          ? "${transactionController.selectedDate.value!.day}/${transactionController.selectedDate.value!.month}/${transactionController.selectedDate.value!.year}"
                          : "DD/MM/YYYY",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Select a Category",
                  style: summaryStyle,
                ),
                const SizedBox(height: 10),
                Obx(() {
                  if (categoryController.allCategories.isEmpty) {
                    return const Text("No categories available.");
                  }
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      categoryController.allCategories.length,
                      (index) {
                        final category =
                            categoryController.allCategories[index];
                        return GestureDetector(
                          onTap: () {
                            transactionController.selectCategory(
                              index: index,
                              categoryId: category.id ?? 0,
                            );
                          },
                          child: Chip(
                            label: Text(category.categoryLabel),
                            backgroundColor: transactionController
                                        .selectedCategoryIndex.value ==
                                    index
                                ? Colors.green
                                : Colors.grey.shade300,
                            labelStyle: TextStyle(
                              color: transactionController
                                          .selectedCategoryIndex.value ==
                                      index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            if (formKey.currentState != null &&
                formKey.currentState!.validate() &&
                transactionController.selectedDate.value != null) {
              final transaction = SpendingsModel(
                title: titleController.text,
                amount: double.parse(amountController.text),
                type: transactionController.selectedTransactionType.value,
                date:
                    transactionController.selectedDate.value!.toIso8601String(),
                categoryId: transactionController.selectedCategoryId.value!,
                mode: transactionController.selectedMode.value,
              );

              transactionController.addTransactionData(transaction);
              titleController.clear();
              amountController.clear();
              transactionController.resetSelections();
            } else {
              Get.snackbar(
                "Error",
                "Please fill all required fields and select a category.",
                backgroundColor: Colors.red.shade300,
              );
            }
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      );
    });
  }
}
