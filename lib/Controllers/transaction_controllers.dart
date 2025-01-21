import 'package:budget_tracker_app/Helper/db_helper.dart';
import 'package:get/get.dart';
import 'package:budget_tracker_app/Model/spendings_model.dart';

class TransactionControllers extends GetxController {
  RxList<SpendingsModel> transactions = <SpendingsModel>[].obs;
  RxDouble totalBudget = 0.0.obs;
  RxDouble remainingBudget = 0.0.obs;
  RxString selectedMode = 'online'.obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<int?> selectedCategoryId = Rx<int?>(null);
  RxInt selectedCategoryIndex = 0.obs;
  RxString selectedTransactionType = 'expense'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBudgetData(); // Fetch budget data on initialization
    fetchTransactions(); // Fetch transactions
  }

  /// Fetches budget data from the database
  Future<void> fetchBudgetData() async {
    try {
      final budget = await DbHelper.dbHelper.fetchBudget();

      // Ensure budget is not null and contains required keys
      if (budget != null) {
        totalBudget.value = budget['totalBudget'] ?? 0.0;
        remainingBudget.value = budget['remainingBudget'] ?? 0.0;
      }
    } catch (e) {
      // Log the error if fetchBudget fails
      print("Error fetching budget data: $e");
    }
  }

  /// Sets total and remaining budgets and updates the database
  void setTotalBudget(double budget) {
    totalBudget.value = budget;
    remainingBudget.value = budget;
    DbHelper.dbHelper.updateBudget(totalBudget.value, remainingBudget.value);
  }

  /// Calculates remaining budget based on transactions
  void calculateBudget() {
    remainingBudget.value = totalBudget.value; // Reset remaining budget
    for (var txn in transactions) {
      if (txn.type == 'expense') {
        remainingBudget.value -= txn.amount;
      }
    }
  }

  /// Fetches all transactions from the database and updates the list
  Future<void> fetchTransactions() async {
    try {
      List<Map<String, dynamic>> transactionList =
          await DbHelper.dbHelper.fetchAllTransactions();

      // Map transactions to the RxList
      transactions.value = transactionList.map((txn) {
        return SpendingsModel(
          id: txn['transaction_id'],
          title: txn['transaction_title'],
          amount: (txn['transaction_amount'] as num).toDouble(),
          type: txn['transaction_type'],
          date: txn['transaction_date'],
          categoryId: txn['transaction_category_id'],
          mode: txn['transaction_mode'],
        );
      }).toList();

      // Recalculate budget after fetching transactions
      calculateBudget();
    } catch (e) {
      // Log the error if fetchTransactions fails
      print("Error fetching transactions: $e");
    }
  }

  /// Adds a new transaction and refreshes the transaction list
  Future<void> addTransactionData(SpendingsModel transaction) async {
    try {
      await DbHelper.dbHelper.insertTransactionData(
        title: transaction.title,
        type: transaction.type,
        mode: transaction.mode,
        amount: transaction.amount,
        date: transaction.date,
        categoryID: transaction.categoryId,
      );

      // Refresh transactions after adding a new one
      fetchTransactions();
    } catch (e) {
      // Log the error if adding transaction fails
      print("Error adding transaction: $e");
    }
  }

  /// Sets the selected date
  void setDate(DateTime? date) {
    selectedDate.value = date;
  }

  /// Resets all selections to default values
  void resetSelections() {
    selectedMode.value = 'online';
    selectedDate.value = null;
    selectedCategoryId.value = null;
    selectedCategoryIndex.value = 0;
    selectedTransactionType.value = 'expense';
  }

  /// Selects a category and updates the index and ID
  void selectCategory({required int index, required int categoryId}) {
    selectedCategoryIndex.value = index;
    selectedCategoryId.value = categoryId;
  }

  /// Sets the transaction type (e.g., 'expense' or 'income')
  void setTransactionType(String type) {
    selectedTransactionType.value = type;
  }
}
