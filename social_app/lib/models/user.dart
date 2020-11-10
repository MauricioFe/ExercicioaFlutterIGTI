import 'package:social_app/models/address.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  String phone;
  Address address;
  String website;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        username = json['username'],
        address = Address.fromJson(json['address']),
        website = json['website'];
}
