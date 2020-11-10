import 'package:flutter/material.dart';
import 'package:view_album_photo/models/album.dart';
import 'package:view_album_photo/screen/photo_list.dart';
import 'package:view_album_photo/service/placeholder_service.dart';

class AlbumList extends StatefulWidget {
  final int userId;

  AlbumList(this.userId);

  @override
  _AlbumListState createState() => _AlbumListState(userId);
}

class _AlbumListState extends State<AlbumList> {
  final int _userId;

  _AlbumListState(this._userId);

  final PlaceholderService _placeholderService = PlaceholderService();

  @override
  void initState() {
    _placeholderService.getAlbums(_userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Albums"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder<List<Album>>(
          future: _placeholderService.getAlbums(_userId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (photo) =>
                                    PhotoList(snapshot.data[index].id)));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                '${snapshot.data[index].title}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ],
                        ),
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
