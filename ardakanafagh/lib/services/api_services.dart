import 'dart:convert'; // اضافه کردن کتابخانه dart:convert
import 'package:http/http.dart' as http;
import '../config.dart';
import '../model/category_model.dart';
import '../model/news_model.dart';

class APIService {
  static var client = http.Client();

  static Future<List<CategoryModel>> fetchCategories() async {
    var response =
    await client.get(Uri.parse(Config.apiURL + Config.categoryURL));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return categoryFromJson(jsonString);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future<List<NewsModel>> fetchPosts(int categoryId) async {
    var response = await client.get(Uri.parse(Config.apiURL + Config.categoryURL));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      // استفاده از تابع parseNewsList برای پارسینگ و تبدیل jsonString به لیست NewsModel
      return parseNewsList(jsonString);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  static List<NewsModel> parseNewsList(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<NewsModel>((json) => NewsModel.fromJson(json)).toList();
  }
}
