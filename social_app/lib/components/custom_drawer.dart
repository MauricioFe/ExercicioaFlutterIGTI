import 'package:flutter/material.dart';
import 'package:social_app/screen/feed.dart';
import 'package:social_app/screen/perfil.dart';

class CustomDrawer extends StatelessWidget {
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
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Perfil()));
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
