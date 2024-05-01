import 'package:ardakanafagh/model/news_model.dart';
import 'package:ardakanafagh/news_details.dart';
import 'package:ardakanafagh/utilites/layout_utility.dart';
import 'package:flutter/material.dart';
import 'package:ardakanafagh/model/news_model.dart';


class NewsCardWidget extends StatelessWidget {
  //const NewsCardWidget({Key? key}) : super(key: key);
  final NewsModel model;
   NewsCardWidget({required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsDetails()),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                     model.imageURL),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                     model.categoryName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                   model.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LayoutUtils.iconText(
                        Icon(Icons.timer),
                        Text(
                        model.postedDate,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
