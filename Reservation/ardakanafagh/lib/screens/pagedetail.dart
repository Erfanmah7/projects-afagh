import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {

  final data;

  const PageDetail({Key? key , required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']['rendered']),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 10),
            child: Text(data['title']['rendered'].toString()
                .replaceAll('<p>', '')
                .replaceAll('</p>', '')
                .replaceAll('&#8221', '"')
                .replaceAll('&#8220', '"')
                .replaceAll('&nbsp;', '')
                .replaceAll('&nbsp;', '')
                .replaceAll('<br />', '')
                .replaceAll('</br>', ''),style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "YekanBakh-Bold"), textAlign: TextAlign.justify,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Text(data['content']['rendered'].toString()
                .replaceAll('<p>', '')
                .replaceAll('</p>', '')
                .replaceAll('&#8221', '"')
                .replaceAll('&#8220', '"')
                .replaceAll('&nbsp;', '')
                .replaceAll('&#8230', '...')
                .replaceAll('<br />', '')
                .replaceAll('</br>', '')
              ,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "YekanBakh-Regular"),textAlign: TextAlign.justify,),
          ),
        ],
      ),
    );
  }
}
