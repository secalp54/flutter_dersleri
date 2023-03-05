import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/news.dart';

import 'article.dart';

class NewsService {
  static NewsService singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService() {
    return singleton;
  }

  static Future<List<Articles>?> getNews() async {
    var url = Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=0572640211454c96839506a307b5f0fe");

    final response = await http.get(url);
    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      var list = (responseJson["articles"] as List).map((e) => Articles.fromJson(e)).toList();

      return list;
    }
    return null;
  }
}
