import 'package:http/http.dart' as http;
class PlaceholderService{
  // ignore: non_constant_identifier_names
  final URL_BASE = 'https://jsonplaceholder.typicode.com/';
  getPosts() async{
     var response = await http.get('$URL_BASE/posts');

  }

}