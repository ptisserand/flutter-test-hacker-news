import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:test_hacker_news/story.dart';
import 'package:flutter_html/flutter_html.dart';

class CommentListPage extends StatelessWidget {
  final List<Comment> comments;
  final Story story;

  CommentListPage({this.story, this.comments});
  
  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.story.title),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              alignment: Alignment.center,
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Text("${1+index}", style: TextStyle(fontSize: 22, color: Colors.white))
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              // child: Text(this.comments[index].text, style: TextStyle(fontSize: 18))
              child: Html(
                data: this.comments[index].text,
                onLinkTap: (url) {
                  _launchUrl(url);
                }
              )
            ),
          );
        }
      )
    );
  }
}