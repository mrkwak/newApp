import 'package:flutter/material.dart';
import 'package:newsapp/screens/new_article_detail_screen.dart';
import 'package:newsapp/utils/constans.dart';
import 'package:newsapp/viewmodels/news_article_list_view_model.dart';
import 'package:newsapp/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    //! Teddy : 함수 이름이 직관적이지 않음
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  void _showNewsArticleDetials(context, article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return NewsArticleDetailScreen(
            article: article,
          );
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);

    listViewModel.loadingStatus;

    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        PopupMenuButton(
            onSelected: (country) {
              listViewModel.topHeadlinesByCountry(
                  Constans.Countires[country].toString());
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constans.Countires.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            })
      ]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeadLine(
              title: "News",
            ),
            SubTitle(
              title: "HeadLine news",
            ),
            Expanded(
              child: NewsGrid(
                articles: listViewModel.articles,
                pageToDetails: _showNewsArticleDetials,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String title;
  const SubTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
      child: Text(title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }
}

class HeadLine extends StatelessWidget {
  final String title;
  const HeadLine({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            title,
            style: TextStyle(fontSize: 50),
          ),
        ),
        Divider(
          color: Color(0xffff8a30),
          height: 40,
          thickness: 8,
          indent: 30,
          endIndent: 20,
        ),
      ],
    );
  }
}
