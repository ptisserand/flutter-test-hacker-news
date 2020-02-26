import 'package:flutter/material.dart';
import 'package:test_hacker_news/topArticleList.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hacker News",
      home: TopArticleList()
    );
  }
}