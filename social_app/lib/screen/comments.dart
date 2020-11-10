import 'package:flutter/material.dart';
import 'package:social_app/models/comment.dart';
import 'package:social_app/service/placeholderService.dart';

class Comments extends StatelessWidget {
  final int postId;

  Comments(this.postId);

  final _placeholderService = PlaceholderService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Comentários"),
          centerTitle: true,
        ),
        body: Container(
          child: FutureBuilder<List<Comment>>(
            future: _placeholderService.getComments(postId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('${snapshot.data[index].name}'),
                            subtitle: Text('${snapshot.data[index].name}'),
                          )
                        ],
                      ),
                    );
                  },
                );
              }else if(snapshot.hasError){
                return Text('Error');
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
