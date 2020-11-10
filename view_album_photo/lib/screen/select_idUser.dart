import 'package:flutter/material.dart';
import 'package:view_album_photo/screen/albuns_list.dart';

class SelectIdUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _usuarioIdController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Usuários"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
                child: Image.asset(
                  'assets/user.png',
                  width: 200,
                  height: 200,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _usuarioIdController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: "Id do usuário",
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          FlatButton(
              padding: EdgeInsets.all(10),
              color: Color.fromRGBO(3, 166, 90, 1),
              onPressed: () =>
              {
                Navigator.push(context, MaterialPageRoute(
                    builder: (comment) =>
                        AlbumList(int.parse(_usuarioIdController.text)))
                )
              },
              child: Text(
                "Enviar",
                style: TextStyle(fontSize: 30, color: Colors.white),
              )),
        ],
      ),
    );
  }
}
