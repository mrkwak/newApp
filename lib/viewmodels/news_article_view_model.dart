import 'package:newsapp/models/news_article.dart';

class NewsArticleViewModel {
  NewsArticle? _newsArticle;
  NewsArticleViewModel({NewsArticle? article}) : _newsArticle = article;

  String? get title {
    return _newsArticle?.title;
  }

  String? get description {
    return _newsArticle?.description;
  }

  String? get imageUrl {
    return _newsArticle?.urlToImage;
  }

  String? get url {
    return _newsArticle?.url;
  }

  String? get author {
    return _newsArticle?.author;
  }

  String? get publishedAt {
    return _newsArticle?.publishedAt;
  }

  // String get content {
  //   return _newsArticle.content;
  // }
}
