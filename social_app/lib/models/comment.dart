class Comment{
  int postId;
  int id;
  String name;
  String email;
  String body;
  Comment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        postId = json['postId'],
        name = json['name'],
        email = json['email'],
        body = json['body'];
}