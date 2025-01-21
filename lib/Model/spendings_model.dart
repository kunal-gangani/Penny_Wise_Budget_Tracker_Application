class SpendingsModel {
  int? id;
  String title;
  String type;
  String mode;
  double amount;
  String date;
  int categoryId;

  SpendingsModel({
    this.id,
    required this.title,
    required this.type,
    required this.mode,
    required this.amount,
    required this.date,
    required this.categoryId,
  });

  factory SpendingsModel.fromJson(Map<String, dynamic> json) {
    return SpendingsModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      mode: json['mode'],
      amount: json['amount'],
      date: json['date'],
      categoryId: json['categoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'mode': mode,
      'amount': amount,
      'date': date,
      'categoryId': categoryId,
    };
  }
}
