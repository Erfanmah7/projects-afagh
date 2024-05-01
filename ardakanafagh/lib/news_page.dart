import 'package:ardakanafagh/controllers/posts_controller.dart';
import 'package:ardakanafagh/widget/news_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsPage extends StatefulWidget {
  // const NewsPage({Key? key}) : super(key: key);
  late int categoryID;
  late bool isRelod;

  NewsPage({required this.categoryID, required this.isRelod});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final PostsController postsController = Get.put(PostsController());
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      if (this.widget.isRelod) {
        await postsController.fetchPosts(categoryId: this.widget.categoryID);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return newsList();
  }

  Widget newsList() {
    return Container(
      child: Obx(() {
        if (postsController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return RefreshIndicator(
            key: refreshKey,
            onRefresh: () =>
                postsController.fetchPosts(categoryId: this.widget.categoryID),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: postsController.postsList.length,
              itemBuilder: (context, index) {
                return NewsCardWidget(
                  model: postsController.postsList[index],
                );
              },
            ),
          );
        }
      }),
    );
  }
}
