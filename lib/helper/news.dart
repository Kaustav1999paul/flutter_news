import 'dart:convert';

import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{

  List<ArticleModel> news  = [];

 Future<void> getNews() async {
   String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=c9bd769bb5944b5db910f6c46d750d3b";

   var response = await http.get(url);
   var jsonData = jsonDecode(response.body);
   if(jsonData['status'] == "ok"){
     jsonData["articles"].forEach((element){
       if(element["urlToImage"] != null && element["title"] != null){
         ArticleModel articleModel = ArticleModel(
           title: element['title'],
           author: element["author"],
           description: element["description"],
           url: element["url"],
           urlToImage: element["urlToImage"],
           content: element["content"]
         );
         news.add(articleModel);
       }
     });

   }
 }


}