import 'dart:convert';

import 'package:http/http.dart' as http;

class MyCategory{
  String baseUrl = "https://ardakanafagh.ir/wp-json/wp/v2/posts?_embed&categories=1";
  Future<List> getCategoryPost() async{
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