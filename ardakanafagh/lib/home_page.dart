import 'package:ardakanafagh/controllers/categories_controller.dart';
import 'package:ardakanafagh/news_page.dart';
import 'package:ardakanafagh/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Widget> tabs = [];

  final CategoriesController categoriesController =
      Get.put(CategoriesController());

  @override
  void initState() {
    super.initState();
    // tabs.add(tab('News'));
    // tabs.add(tab('Advertisements'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx(() {
        if (categoriesController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return DefaultTabController(
            length: categoriesController.categoriesList.length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Ardakanafagh.ir'),
                backgroundColor: afagh,
                elevation: 0,
                bottom: TabBar(
                    tabs: categoriesController.categoriesList
                        .map((model) => tab(model.categoryName))
                        .toList()),
                actions: const <Widget>[
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.notifications),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              body: TabBarView(
                children: categoriesController.categoriesList.map((model) {
                  return NewsPage(
                    categoryID: model.categoryId,
                    isRelod: true,
                  );
                }).toList(),
              ),
            ),
          );
        }
      }),
    );
  }

  Widget tab(String tabName) {
    return Tab(
      text: tabName,
    );
  }
}
