import 'package:ardakanafagh/screens/categorypost.dart';
import 'package:ardakanafagh/screens/latestpost.dart';
import 'package:ardakanafagh/screens/photos.dart';
import 'package:ardakanafagh/screens/videos.dart';
import 'package:ardakanafagh/widgets/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> topTabs = <Tab>[
    Tab(
      child: Text(
        "جديدترين ها",
        style: TextStyle(fontSize: 13, fontFamily: "YekanBakh-Bold"),
      ),
    ),
    Tab(
      child: Text(
        "پر بازدیدها",
        style: TextStyle(fontSize: 13, fontFamily: "YekanBakh-Bold"),
      ),
    ),
    Tab(
      child: Text(
        "ویدئوها",
        style: TextStyle(fontSize: 13, fontFamily: "YekanBakh-Bold"),
      ),
    ),
    Tab(
      child: Text(
        "تصاویر",
        style: TextStyle(fontSize: 13, fontFamily: "YekanBakh-Bold"),
      ),
    ),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: topTabs.length, initialIndex: 0, vsync: this)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  Future<bool> _onWillPop() async {
    print("on Will Pop");
    if (_tabController?.index == 0) {
      await SystemNavigator.pop();
    }

    Future.delayed(Duration(microseconds: 200), () {
      print("Set Index");
      _tabController?.index == 0;
    });

    print("Return");
    return _tabController?.index == 0;
  }

  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Align(
            child: Text("Ardakanafagh.ir"),
            alignment: Alignment.centerLeft,
          ),
          // centerTitle: true,
          // leading: Container(
          //   child: IconButton(
          //       icon: Icon(Icons.search),splashRadius: 20,
          //       onPressed: () {
          //         print("Search Button Clicked");
          //       }),
          // ),

          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black54,
            tabs: topTabs,
          ),
        ),
        drawer: MyDrawer(),
        body: TabBarView(
          controller: _tabController,
          children: [
            LatestPost(),
            CategoryPost(),
            Videos(),
            Photos(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    'در حال بروزرسانی...',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "YekanBakh-Bold"),
                    textAlign: TextAlign.justify,
                  ),
                  content: const Text(
                    'این بخش در آپدیت های بعدی اضافه خواهد شد.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "YekanBakh-Regular"),
                    textAlign: TextAlign.justify,
                  ),
                  actions: <Widget>[
                    // TextButton(
                    //   onPressed: () => Navigator.pop(context, 'Cancel'),
                    //   child: const Text('Cancel'),
                    // ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text(
                        'باشه',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "YekanBakh-Bold"),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Icon(Icons.radio_rounded)),
      ),
    );
  }
}

// actions: [
//
// Container(
// child: IconButton(
// icon: Icon(Icons.menu),
// onPressed: () => _scaffoldkey.currentState!.openDrawer(),
// ),
// ),
// ],
