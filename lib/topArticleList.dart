import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_hacker_news/story.dart';
import 'package:test_hacker_news/webservice.dart';

class TopArticleList extends StatefulWidget {
  @override
  _TopArticleListState createState() => _TopArticleListState();
}

class _TopArticleListState extends State<TopArticleList> {

  List<Story> _stories = List<Story>();

  void initState() {
    super.initState();
    _populateTopStories();
  }

  void _populateTopStories() async {
    final responses = await WebService().getTopStories();
    final stories = responses.map((response) {
      final json = jsonDecode(response.body);
      return Story.fromJSON(json);
    }).toList();

    setState(() {
      _stories = stories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hacker News"),
        backgroundColor: Colors.orange
      ),
      body: ListView.builder(
        itemCount: _stories.length,
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () {

            },
            title: Text(_stories[index].title, style: TextStyle(fontSize: 18)),
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              alignment: Alignment.center,
              width: 50,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("${_stories[index].commentIds.length}", style: TextStyle(color: Colors.white))
                )
            ),
          );
      }),
    );
  }
}