import 'dart:convert';

List<CategoryModel> categoryFromJson(String str) => List<CategoryModel>.from(
  json.decode(str).map(
        (x) => CategoryModel.fromJson(x),
  ),
);

class CategoryModel {
  late int categoryId;
  late String categoryName;
  late int count;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.count,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json["id"];
    categoryName = json["name"];
    count = json["count"];
  }
}
