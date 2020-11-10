import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/screen/feed.dart';
import 'package:social_app/screen/perfil.dart';
import 'package:social_app/service/placeholderService.dart';

class CustomDrawer extends StatelessWidget {
  final _placeholderService = PlaceholderService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Image.asset('assets/user.png')),
          ListTile(
              title: Text("Perfil", style: TextStyle(fontSize: 20)),
              onTap: () {
                _placeholderService.getPerfil().then((user) {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Perfil(user)));
                });
              }),
          ListTile(
              title: Text("Feed", style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Feed()));
              }),
        ],
      ),
    );
  }
}
