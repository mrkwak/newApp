import 'package:dio/dio.dart';
import 'package:newsapp/models/news_article.dart';

class WebService {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=kr&apiKey=6a74cfb9348344a1ac638159da441403';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to Connect ${response.statusCode}");
    }
  }

  Future<List<NewsArticle>> fetchHeadlinesByCountry(country) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=kr&apiKey=6a74cfb9348344a1ac638159da441403';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to Connect ${response.statusCode}");
    }
  }
}
