import 'package:get/get.dart';
import '../model/category_model.dart';
import '../services/api_services.dart';

class CategoriesController extends GetxController {
  var isLoading = true.obs;
  var categoriesList = RxList<CategoryModel>();

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      var categories = await APIService.fetchCategories();
      if (categories.length > 0) {
        categoriesList.clear();
        categoriesList.addAll(categories);
      }
    } finally {
      isLoading(false);
    }
  }
}
