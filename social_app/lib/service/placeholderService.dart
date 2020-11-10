import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_app/models/comment.dart';
import 'dart:async';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/user.dart';

class PlaceholderService {
  // ignore: non_constant_identifier_names
  final URL_BASE = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    var response = await http.get('$URL_BASE/posts');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var posts = objs.map((obj) => Post.fromJson(obj)).toList();
      return posts;
    } else {
      throw Exception("Erro ao buscar posts");
    }
  }

  Future<User> getPerfil() async  {
    var response = await http.get('$URL_BASE/users/1');
    if (response.statusCode == 200) {
      var user = User.fromJson(jsonDecode(response.body));
      return user;
    } else {
      throw Exception("Erro ao buscar users");
    }
  }
  Future<List<Comment>> getComments(int postId) async {
    var response = await http.get('$URL_BASE/posts/$postId/comments');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var comments = objs.map((obj) => Comment.fromJson(obj)).toList();
      return comments;
    } else {
      throw Exception("Erro ao buscar comments");
    }
  }
}


