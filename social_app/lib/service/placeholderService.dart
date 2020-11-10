import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/post.dart';

class PlaceholderService {
  // ignore: non_constant_identifier_names
  final URL_BASE = 'https://jsonplaceholder.typicode.com';

  getPosts() async {
    var response = await http.get('$URL_BASE/posts');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var posts = objs.map((obj) => Post.fromJson(obj)).toList();
      return posts;
    } else {
      throw Exception("Erro ao buscar posts");
    }
  }
}
