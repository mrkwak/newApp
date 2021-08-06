import 'package:flutter/material.dart';
import 'package:newsapp/test.dart';
import 'package:newsapp/viewmodels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  void initState() {
    super.initState();
    // var test = Provider.of<NewsArticleListViewModel>(context, listen: false);
    Provider.of<NewsArticleListViewModel>(context, listen: false);
    // context.read<NewsArticleListViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    // var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    // var listViewModel = context.watch<NewsArticleListViewModel>();
    return Scaffold(
      appBar: AppBar(),
      body: Text(''),
    );
  }
}
