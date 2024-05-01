import 'package:ardakanafagh/utilites/layout_utility.dart';
import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://picsum.photos/id/1084/536/354?grayscale",
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            expandedHeight: 250,
          ),
          SliverFillRemaining(
            child: newsDetailSection(),
          ),
        ],
      ),
    );
  }

  Widget newsDetailSection() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          row1(),
          LayoutUtils.iconText(
            Icon(Icons.timer),
            Text("01st Jan 2023"),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "sfsdfsfdsfsfsfsfsdfsdgsg gsgsdgsdg",
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            child: Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            width: 100,
          ),
          //  Expanded(
          //   child: HtmlWidget(
          //     '''
          //     <p style="color: grey; font-size: larger;">test news</p>
          //     ''',
          //     textStyle: TextStyle(color: Colors.grey, fontSize: 20),
          //   ),
          // ),

        ],
      ),
    );
  }

  Widget row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'jhjh',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.shield_moon),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.mark_chat_read),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
