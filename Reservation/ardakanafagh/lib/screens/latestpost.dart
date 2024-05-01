import 'package:ardakanafagh/screens/postdetail.dart';
import 'package:ardakanafagh/services/post.dart';
import 'package:flutter/material.dart';

class LatestPost extends StatefulWidget {
  const LatestPost({Key? key}) : super(key: key);

  @override
  State<LatestPost> createState() => _LatestPostState();
}

class _LatestPostState extends State<LatestPost> {
  Post PostService = Post();

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 8),
      child: FutureBuilder<List>(
        future: PostService.getAllPost(),
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
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.network(snapshot.data![i]['_embedded']
                            ['wp:featuredmedia'][0]['source_url']),
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
                                builder: (context) => PostDetail(data:snapshot.data?[i]),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            snapshot.data![i]['content']['rendered']
                                .toString()
                                .replaceAll('<p>', '')
                                .replaceAll('</p>', '')
                                .replaceAll('&#8221', '"')
                                .replaceAll('&#8220', '"')
                                .replaceAll('&nbsp;', '')
                                .replaceAll('<br />', ''),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "YekanBakh-Regular",
                                color: Colors.black.withOpacity(0.6)),
                            textAlign: TextAlign.justify,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          buttonPadding: const EdgeInsets.all(1),
                          // Adjust the minimum width of buttons
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.share,
                                  size: 17,
                                ),
                                splashRadius: 20),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_outline_outlined,
                                  size: 17,
                                ),
                                splashRadius: 20)
                          ],
                        ),
                      ],
                    ),
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
    );
  }
}

// Card(
// child: ListTile(
// title: Column(
// children: [
// Image.network(
// 'https://ardakanafagh.ir/wp-content/uploads/2023/08/169756689.jpg',),
// ListTile(
// title: const Text(
// 'پیش‌ثبت‌نام انتخابات مجلس و رفتار متفاوت احزاب نسبت به چالش «شفافیت»'
// ,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "YekanBakh-Bold"), textAlign: TextAlign.justify,),
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => PostDetail(),
// ),
// );
// },
// ),
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: Text(
// 'مهلت نام‌نویسی در پیش‌ثبت‌نام انتخابات مجلس دوازدهم در حالی به پایان رسید که چالش شفافیت هم‌چنان مورد بحث فعالان سیاسی اجتماعی است.'
// ,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "YekanBakh-Regular",color: Colors.black.withOpacity(0.6)), textAlign: TextAlign.justify,
// ),
// ),
// ButtonBar(
// alignment: MainAxisAlignment.start,
// children: [
// Text("data"),
// ],
// ),
// ],
// ),
// onTap: (){
// Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDetail(),),);
// },
// ),
// );

// Card(
// clipBehavior: Clip.antiAlias,
// child: Column(
// children: [
// Image.network(
// 'https://ardakanafagh.ir/wp-content/uploads/2023/08/169756689.jpg'),
// ListTile(
// title:  Text(
// 'پیش‌ثبت‌نام انتخابات مجلس و رفتار متفاوت احزاب نسبت به چالش «شفافیت»'
// ,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "YekanBakh-Bold"), textAlign: TextAlign.justify,),
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => PostDetail(),
// ),
// );
// },
// ),
// Padding(
// padding:  EdgeInsets.all(10.0),
// child: Text(
// 'مهلت نام‌نویسی در پیش‌ثبت‌نام انتخابات مجلس دوازدهم در حالی به پایان رسید که چالش شفافیت هم‌چنان مورد بحث فعالان سیاسی اجتماعی است.'
// ,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "YekanBakh-Regular",color: Colors.black.withOpacity(0.6)), textAlign: TextAlign.justify,
// ),
// ),
// ButtonBar(
// alignment: MainAxisAlignment.start,
// children: [
// Text("data"),
// ],
// ),
// ],
// ),
// );
