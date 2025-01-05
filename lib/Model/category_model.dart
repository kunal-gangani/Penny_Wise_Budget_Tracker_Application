class CategoryModel {
  int id;
  String categoryName;
  String categoryLabel;
  String categoryIconCode;
  int categoryColor;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryLabel,
    required this.categoryIconCode,
    required this.categoryColor,
  });

  factory CategoryModel.fact({required Map<String, dynamic> data}) {
    return CategoryModel(
      id: data['id'],
      categoryName: data['category_name'],
      categoryLabel: data['category_label'],
      categoryIconCode: data['category_icon_code'],
      categoryColor: data['category_color'],
    );
  }
}
