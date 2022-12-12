import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/articles.dart';
import '../model/news.dart';

class NewsService {

  Future<List<Articles>> fetchNews(String category) async {
    String url = 'https://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=f91d8b674ce0462caa4594ebb526d9db';
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200) {
      final result = json.decode(response.body);
      News news =News.fromJson(result);
      return news.articles ?? [];

    }
    throw Exception('Bad request');

  }

}