import 'package:ardakanafagh/screens/postdetail.dart';
import 'package:flutter/material.dart';

class CategoryPost extends StatefulWidget {
  const CategoryPost({Key? key}) : super(key: key);

  @override
  State<CategoryPost> createState() => _CategoryPostState();
}

class _CategoryPostState extends State<CategoryPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 8),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, i) {
            return Card(
              child: ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Image.network(
                          "https://ardakanafagh.ir/wp-content/uploads/2023/08/photo_2023-08-13_17-59-17.jpg"),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10, right: 10),
                        child: Text(
                          "رفع تخلف نمای غیر مجاز در بافت تاریخی شهر اردکان",
                          style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "YekanBakh-Bold"), textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(bottom: 10,top: 10),
                  child: Text(
                    "مالک ساختمان بدون اطلاع و مجوز اداره میراث فرهنگی، در حریم بافت تاریخی اقدام به اجرای نمای غیر مجاز کرده و ورود اداره میراث فرهنگی طی مذاکره ای رفع تخلف آن در حال اجرا است.",
                    style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "YekanBakh-Regular"), textAlign: TextAlign.justify,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Text('hello'),),);
                },
              ),
            );
          }),
    );
  }
}
