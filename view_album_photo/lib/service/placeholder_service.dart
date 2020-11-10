import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:view_album_photo/models/album.dart';
class PlaceholderService{
    final String URL_BASE = 'https://jsonplaceholder.typicode.com';
    Future<List<Album>> getAlbuns() async {
        var response = await http.get('$URL_BASE/posts');
        if (response.statusCode == 200) {
            var objs = jsonDecode(response.body) as List;
            var albuns = objs.map((obj) => Album.fromJson(obj)).toList();
            return albuns;
        } else {
            throw Exception("Erro ao buscar albuns");
        }
    }
}