import 'package:flutter/material.dart';
import 'package:newsapp/screens/news_screen.dart';
import 'package:newsapp/test.dart';
import 'package:newsapp/viewmodels/news_article_list_view_model.dart';
import 'package:newsapp/viewmodels/news_article_view_model.dart';
import 'package:provider/provider.dart';

import 'models/news_article.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<NewsArticleListViewModel>(
          create: (_) => NewsArticleListViewModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
        create: (_) => NewsArticleListViewModel(),
        child: MaterialApp(
          title: 'News App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: ChangeNotifierProvider<NewsArticleListViewModel>(
          //     create: (_) => NewsArticleListViewModel(), child: NewsScreen()),
          home: NewsScreen(),
          // home: MultiProvider(
          //   providers: [
          //     // Provider<NewsArticleListViewModel>(
          //     Provider<Testtest>(
          //       create: (_) => Testtest(),
          //       // create: (_) => NewsArticleListViewModel(),
          //     ),
          //   ],
          //   child: NewsScreen(),
        ));
  }
}
