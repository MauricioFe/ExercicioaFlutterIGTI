import 'package:flutter/material.dart';
import 'package:social_app/service/placeholderService.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}



class _FeedState extends State<Feed> {
  final PlaceholderService _placeholderService = PlaceholderService();
  @override
  void initState() {
    super.initState();
    _placeholderService.getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Feed"),
        centerTitle: true,
      ),
    );
  }

}
