import 'dart:convert';
import 'package:intl/intl.dart';
import '../config.dart';

List<NewsModel> PostsFromJson(String str) => List<NewsModel>.from(
      json.decode(str).map(
            (x) => NewsModel.fromJson(x),
          ),
    );

NewsModel PostDetailsFromJson(String str) =>
    NewsModel.fromJson(json.decode(str));

class NewsModel {
  late int id;
  late String title;
  late String imageURL;
  late String postedDate;
  late int categoryId;
  late String categoryName;
  late String postContent;

  NewsModel({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.postedDate,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    imageURL = json["image_url"];
    postedDate = DateFormat('dd-MMM-yyyy').format(
      DateTime.parse(
        json['post_date'],
      ),
    );

    categoryName = json['category_name'];
    if (json['post_content'] != null) {
      postContent = json['post_content'];
    }
  }
}
