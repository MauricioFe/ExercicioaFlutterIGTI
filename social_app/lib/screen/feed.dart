import 'package:flutter/material.dart';
import 'package:social_app/components/custom_drawer.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/service/placeholderService.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final PlaceholderService _placeholderService = PlaceholderService();
  List<Post> _posts = new List();
  bool isLoading = false;

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
      drawer: CustomDrawer(),
      body: Container(
        child: FutureBuilder<List<Post>>(
          future: _placeholderService.getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              '${snapshot.data[index].title}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${snapshot.data[index].body}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20)),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('error');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
