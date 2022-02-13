import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/article_model.dart';

class ApiService {
  Future<List<Article>> news() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=9317b018f81a439ba5090e6fa8aa31c5"));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
