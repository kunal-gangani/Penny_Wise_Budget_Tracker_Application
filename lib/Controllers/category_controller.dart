import 'package:budget_tracker_app/Helper/db_helper.dart';
import 'package:budget_tracker_app/Model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryController extends GetxController {
  int? selectedIndex;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;

  final Map<String, IconData> iconMap = {
    'MdiIcons.babyBottle': MdiIcons.babyBottle,
    'FontAwesomeIcons.car': FontAwesomeIcons.car,
    'MdiIcons.school': MdiIcons.school,
    'FontAwesomeIcons.film': FontAwesomeIcons.film,
    'FontAwesomeIcons.moneyBill': FontAwesomeIcons.moneyBill,
    'MdiIcons.receipt': MdiIcons.receipt,
    'MdiIcons.shopping': MdiIcons.shopping,
    'FontAwesomeIcons.piggyBank': FontAwesomeIcons.piggyBank,
    'FontAwesomeIcons.utensils': FontAwesomeIcons.utensils,
    'MdiIcons.hospital': MdiIcons.hospital,
    'FontAwesomeIcons.book': FontAwesomeIcons.book,
    'MdiIcons.partyPopper': MdiIcons.partyPopper,
    'FontAwesomeIcons.child': FontAwesomeIcons.child,
    'FontAwesomeIcons.dumbbell': FontAwesomeIcons.dumbbell,
    'MdiIcons.beach': MdiIcons.beach,
    'FontAwesomeIcons.house': FontAwesomeIcons.house,
    'FontAwesomeIcons.gamepad': FontAwesomeIcons.gamepad,
    'MdiIcons.toolbox': MdiIcons.toolbox,
    'MdiIcons.cellphone': MdiIcons.cellphone,
    'FontAwesomeIcons.palette': FontAwesomeIcons.palette,
    'MdiIcons.account': MdiIcons.account,
    'FontAwesomeIcons.ellipsis': FontAwesomeIcons.ellipsis,
  };

  void assignIndexToIcon({required int index}) {
    selectedIndex = index;
    update();
  }

  Future<void> insertData({
    required String title,
    required String label,
    required String iconCode,
    required int colorValue,
  }) async {
    IconData? iconData = iconMap[iconCode];

    if (iconData == null) {
      Get.snackbar(
        "Failed",
        "Invalid icon code",
        backgroundColor: Colors.red.shade300,
      );
      return;
    }

    int? resp = await DbHelper.dbHelper.insertCatData(
      title: title,
      label: label,
      iconCode: iconCode,
      colorValue: colorValue,
    );

    if (resp != null) {
      Get.snackbar(
        "INSERTED",
        "Data added successfully",
        backgroundColor: Colors.green.shade300,
      );
      fetchCategories();
    } else {
      Get.snackbar(
        "Failed",
        "Error adding data, please try again",
        backgroundColor: Colors.red.shade300,
      );
    }
  }

  Future<void> fetchCategories() async {
    List<Map<String, dynamic>> data = await DbHelper.dbHelper.fetchCatData();
    allCategories.value = data
        .map(
          (categoryData) => CategoryModel.fact(
            data: categoryData,
          ),
        )
        .toList();
  }
}
