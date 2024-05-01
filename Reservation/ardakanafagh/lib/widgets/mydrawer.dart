import 'package:ardakanafagh/screens/pagedetail.dart';
import 'package:ardakanafagh/services/page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  MyPage pageService = MyPage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(children: [
          Expanded(
              child: Container(
            child: FutureBuilder<List>(
              future: pageService.getAllPage(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data?.length == 0) {
                    return Center(
                      child: Text("0 post"),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                snapshot.data![i]['title']['rendered']
                                    .toString()
                                    .replaceAll('&#8221', '"')
                                    .replaceAll('&#8220', '"')
                                    .replaceAll('&nbsp;', '')
                                    .replaceAll('<br />', ''),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "YekanBakh-Bold"),
                                textAlign: TextAlign.justify,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PageDetail(data: snapshot.data?[i]),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ))
        ]),
      ),
    );
  }
}
