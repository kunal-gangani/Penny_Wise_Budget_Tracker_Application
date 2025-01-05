import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();
  Database? db;

  final String _categoryTB = "category";
  final String _categoryTitle = "category_name";
  final String _categoryLabel = "category_label";
  final String _categoryIconCode = "category_icon_code";
  final String _categoryColor = "category_color";

  Future<void> initDB() async {
    try {
      String dbPath = await getDatabasesPath();
      String path = "$dbPath/budgetDB.db";

      db = await openDatabase(
        path,
        version: 2,
        onCreate: (db, _) async {
          String createTB = '''CREATE TABLE $_categoryTB(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            $_categoryTitle TEXT NOT NULL,
            $_categoryLabel TEXT NOT NULL,
            $_categoryIconCode TEXT NOT NULL,
            $_categoryColor INTEGER NOT NULL
          )''';
          await db.execute(createTB);
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

  Future<void> deleteOldDB() async {
    try {
      String dbPath = await getDatabasesPath();
      String path = "$dbPath/budgetDB.db";
      await deleteDatabase(path);
      await initDB();
    } catch (e) {
      log("Error deleting database: $e");
    }
  }

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
      int? result = await db?.rawInsert(insertQuery, args);

      return result;
    } catch (e) {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> fetchCatData() async {
    try {
      await initDB();
      String selectQuery = "SELECT * FROM $_categoryTB;";
      List<Map<String, dynamic>> data = await db!.rawQuery(selectQuery);
      return data;
    } catch (e) {
      return [];
    }
  }
}
