import 'package:ardakanafagh/model/news_model.dart';
import 'package:ardakanafagh/services/api_services.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  var isLoading = true.obs;
  var postsList = List<NewsModel>.empty().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPosts({int categoryId = 1}) async {
    try {
      isLoading(true);
      var posts = await APIService.fetchPosts(categoryId);
      postsList.clear();
      if (posts != null) {
        postsList.addAll(posts);
      }
    } finally {
      isLoading(false);
    }
  }
}
