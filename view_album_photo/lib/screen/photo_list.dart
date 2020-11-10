import 'package:flutter/material.dart';
import 'package:view_album_photo/models/photo.dart';
import 'package:view_album_photo/service/placeholder_service.dart';

class PhotoList extends StatelessWidget {
  final int id;

  PhotoList(this.id);

  final PlaceholderService _placeholderService = PlaceholderService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Usuários"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder<List<Photo>>(
          future: _placeholderService.getPhotos(id),
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
                          Image.network('${snapshot.data[index].thumbnailUrl}'),
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
