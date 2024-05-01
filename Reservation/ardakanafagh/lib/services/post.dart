import 'dart:convert';

import 'package:http/http.dart' as http;

class Post{

  String baseUrl = "http://ardakanafagh.ir/wp-json/wp/v2/posts?_embed";

  Future<List> getAllPost() async{

    try{

      var respone = await http.get(Uri.parse(baseUrl));
      print(respone);
      if(respone.statusCode == 200){


        return jsonDecode(respone.body);
      }else{

        return Future.error("Server Error");

      }

    }catch(SocketEXception){

      return Future.error("Error Fetching Data");

    }

  }


}