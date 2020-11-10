import 'package:flutter/material.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/service/placeholderService.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final PlaceholderService _placeholderService = PlaceholderService();
  List<Post> _posts = new List();

  @override
  void initState() {
    super.initState();
    _placeholderService.getPosts().then((resp) {
      setState(() {
        _posts = resp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Feed"),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${_posts[index].title}'),
            );
          }),
    );
  }
}
