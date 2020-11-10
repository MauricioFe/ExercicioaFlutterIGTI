import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/components/custom_drawer.dart';
import 'package:social_app/models/user.dart';

class Perfil extends StatelessWidget {
  final User user;

  Perfil(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Perfil"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '${user.name}',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Text(
                      'Username: ${user.username}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Email: ${user.email}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Telefone: ${user.phone}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Site: ${user.website}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Endereço',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Text(
                      'Cidade: ${user.address.city}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Rua: ${user.address.street}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Complemento: ${user.address.suite}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'CEP: ${user.address.zipcode}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
