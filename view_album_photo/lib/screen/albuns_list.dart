import 'package:flutter/material.dart';

class AlbumList extends StatelessWidget {
  final int userId;

  AlbumList(this.userId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('$userId'),
    );
  }
}
