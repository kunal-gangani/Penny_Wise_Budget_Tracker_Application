import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:budget_tracker_app/Model/category_model.dart';

class DbHelper {
  DbHelper._();

  static final DbHelper dbHelper = DbHelper._();
  Database? db;

  final String _categoryTB = "category";
  final String _categoryTitle = "category_name";
  final String _categoryLabel = "category_label";
  final String _categoryIconCode = "category_icon_code";
  final String _categoryColor = "category_color";

  final String _transactionTB = "transactions";
  final String _transcationID = "transaction_id";
  final String _transactionTitle = "transaction_title";
  final String _transactionAmount = "transaction_amount";
  final String _transactionType = "transaction_type";
  final String _transactionMode = "transaction_mode";
  final String _transactionDate = "transaction_date";
  final String _transactionCategoryID = "transaction_category_id";

  // Initialize the Database
  Future<void> initDB() async {
    try {
      String dbPath = await getDatabasesPath();
      String path = "$dbPath/budgetDB.db";

      db = await openDatabase(
        path,
        version: 2,
        onCreate: (db, version) async {
          String createCategoryTB = '''CREATE TABLE $_categoryTB(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            $_categoryTitle TEXT NOT NULL,
            $_categoryLabel TEXT NOT NULL,
            $_categoryIconCode TEXT NOT NULL,
            $_categoryColor INTEGER NOT NULL
          )''';
          await db.execute(createCategoryTB);

          String createTransactionsTb = '''CREATE TABLE $_transactionTB(
          $_transcationID INTEGER PRIMARY KEY AUTOINCREMENT,
          $_transactionTitle TEXT NOT NULL,
          $_transactionType TEXT NOT NULL,
          $_transactionMode TEXT NOT NULL,
          $_transactionAmount NUMERIC NOT NULL,
          $_transactionDate TEXT NOT NULL,
          $_transactionCategoryID INTEGER NOT NULL
          )''';
          await db.execute(createTransactionsTb);
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion < 2) {
            await db.execute(
                '''ALTER TABLE $_categoryTB ADD COLUMN $_categoryColor INTEGER NOT NULL DEFAULT 0''');
          }
        },
      );
    } catch (e) {
      log("Error initializing database: $e");
    }
  }

  /// General Utility Methods
  Future<void> deleteDB() async {
    try {
      String dbPath = await getDatabasesPath();
      String path = "$dbPath/budgetDB.db";
      await deleteDatabase(path);
      log("Database deleted successfully.");
    } catch (e) {
      log("Error deleting database: $e");
    }
  }

  Future<bool> dbExists() async {
    String dbPath = await getDatabasesPath();
    String path = "$dbPath/budgetDB.db";
    return databaseExists(path);
  }

  /// Category Methods
  Future<int?> insertCatData({
    required String title,
    required String label,
    required String iconCode,
    required int colorValue,
  }) async {
    try {
      await initDB();
      String insertQuery =
          '''INSERT INTO $_categoryTB ($_categoryTitle, $_categoryLabel, $_categoryIconCode, $_categoryColor) VALUES (?,?,?,?)''';
      List args = [title, label, iconCode, colorValue];
      return await db?.rawInsert(insertQuery, args);
    } catch (e) {
      log("Error inserting category: $e");
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> fetchCatData() async {
    try {
      await initDB();
      String selectQuery = "SELECT * FROM $_categoryTB;";
      return await db!.rawQuery(selectQuery);
    } catch (e) {
      log("Error fetching categories: $e");
      return [];
    }
  }

  Future<List<CategoryModel>> fetchMatchingCategories({
    required String search,
  }) async {
    try {
      await initDB();
      String searchQuery =
          "SELECT * FROM $_categoryTB WHERE $_categoryTitle LIKE '%$search%';";
      List<Map<String, dynamic>> resp = await db!.rawQuery(searchQuery);
      return resp.map((data) {
        return CategoryModel.fact(data: data);
      }).toList();
    } catch (e) {
      log("Error fetching categories: $e");
      return [];
    }
  }

  Future<int?> updateCategory({
    required int id,
    required String title,
    required String label,
    required String iconCode,
    required int colorValue,
  }) async {
    try {
      await initDB();
      String updateQuery = '''UPDATE $_categoryTB 
          SET $_categoryTitle = ?, 
              $_categoryLabel = ?, 
              $_categoryIconCode = ?, 
              $_categoryColor = ? 
          WHERE id = ?;''';
      return await db
          ?.rawUpdate(updateQuery, [title, label, iconCode, colorValue, id]);
    } catch (e) {
      log("Error updating category: $e");
      return null;
    }
  }

  Future<int?> deleteCategory({required int id}) async {
    try {
      await initDB();
      String deleteQuery = "DELETE FROM $_categoryTB WHERE id = ?;";
      return await db?.rawDelete(deleteQuery, [id]);
    } catch (e) {
      log("Error deleting category: $e");
      return null;
    }
  }

  /// Transaction Methods
  Future<int?> insertTransactionData({
    required String title,
    required String type,
    required String mode,
    required num amount,
    required String date,
    required int categoryID,
  }) async {
    try {
      await initDB();
      String insertQuery = '''INSERT INTO $_transactionTB
        ($_transactionTitle,$_transactionType,$_transactionMode,$_transactionAmount,$_transactionDate,$_transactionCategoryID) 
        VALUES(?,?,?,?,?,?)''';
      List args = [title, type, mode, amount, date, categoryID];
      return await db?.rawInsert(insertQuery, args);
    } catch (e) {
      log("Error inserting transaction: $e");
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> fetchAllTransactions() async {
    try {
      await initDB();
      String query = "SELECT * FROM $_transactionTB;";
      return await db!.rawQuery(query);
    } catch (e) {
      log("Error fetching transactions: $e");
      return [];
    }
  }

  Future<int?> deleteTransactionByID({required int id}) async {
    try {
      await initDB();
      String deleteQuery =
          "DELETE FROM $_transactionTB WHERE $_transcationID = ?;";
      return await db?.rawDelete(deleteQuery, [id]);
    } catch (e) {
      log("Error deleting transaction: $e");
      return null;
    }
  }

  Future<int?> updateTransactionByID({
    required int id,
    required String title,
    required String type,
    required String mode,
    required num amount,
    required String date,
    required int categoryID,
  }) async {
    try {
      await initDB();
      String updateQuery = '''UPDATE $_transactionTB 
          SET $_transactionTitle = ?, 
              $_transactionType = ?, 
              $_transactionMode = ?, 
              $_transactionAmount = ?, 
              $_transactionDate = ?, 
              $_transactionCategoryID = ? 
          WHERE $_transcationID = ?;''';
      return await db?.rawUpdate(
          updateQuery, [title, type, mode, amount, date, categoryID, id]);
    } catch (e) {
      log("Error updating transaction: $e");
      return null;
    }
  }

  Future<Map<String, double>> fetchBudget() async {
    try {
      await initDB();
      String expenseQuery = '''
      SELECT SUM($_transactionAmount) AS totalExpenses 
      FROM $_transactionTB 
      WHERE $_transactionType = 'expense';
    ''';

      String incomeQuery = '''
      SELECT SUM($_transactionAmount) AS totalIncome 
      FROM $_transactionTB 
      WHERE $_transactionType = 'income';
    ''';

      final expenseResult = await db!.rawQuery(expenseQuery);
      final incomeResult = await db!.rawQuery(incomeQuery);

      double totalExpenses =
          (expenseResult.first['totalExpenses'] ?? 0) as double;
      double totalIncome = (incomeResult.first['totalIncome'] ?? 0) as double;

      double remainingBudget = totalIncome - totalExpenses;

      return {
        'totalBudget': totalIncome,
        'remainingBudget': remainingBudget,
      };
    } catch (e) {
      log("Error fetching budget: $e");
      return {'totalBudget': 0.0, 'remainingBudget': 0.0};
    }
  }

  Future<void> updateBudget(double totalBudget, double remainingBudget) async {
    try {
      log("Budget updated: Total = $totalBudget, Remaining = $remainingBudget");
    } catch (e) {
      log("Error updating budget: $e");
    }
  }
}
