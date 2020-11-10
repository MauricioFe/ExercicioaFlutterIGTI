import 'package:flutter/material.dart';
import 'package:social_app/components/custom_drawer.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Perfil"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
    );
  }
}
