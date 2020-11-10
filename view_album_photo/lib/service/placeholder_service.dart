import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:view_album_photo/models/album.dart';
import 'package:view_album_photo/models/photo.dart';
class PlaceholderService{
    final String URL_BASE = 'https://jsonplaceholder.typicode.com';
    Future<List<Album>> getAlbums(int id) async {
        var response = await http.get('$URL_BASE/users/$id/albums');
        if (response.statusCode == 200) {
            var objs = jsonDecode(response.body) as List;
            var albums = objs.map((obj) => Album.fromJson(obj)).toList();
            return albums;
        } else {
            throw Exception("Erro ao buscar albuns");
        }
    }

  Future<List<Photo>> getPhotos(int id) async {
      var response = await http.get('$URL_BASE/users/$id/albums');
      if (response.statusCode == 200) {
          var objs = jsonDecode(response.body) as List;
          var photos = objs.map((obj) => Photo.fromJson(obj)).toList();
          return photos;
      } else {
          throw Exception("Erro ao buscar photo");
      }
  }
}