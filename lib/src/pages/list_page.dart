import 'package:Simpagi/src/db/operation.dart';
import 'package:Simpagi/src/pages/save_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  static const String routeName = '/list';
  @override
  Widget build(BuildContext context) {
    //Operation.notes();
    Operation operation = Operation();
    operation.notes;
    return Scaffold(
      // Ubicar Boton para Navegacion
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Save');
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 121, 204, 118),
      ),
      appBar: AppBar(
        title: Text("Listado"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Nota 1"),
            ),
            ListTile(
              title: Text("Nota 2"),
            ),
            ListTile(
              title: Text("Nota 3"),
            ),
            ListTile(
              title: Text("Nota 4"),
            )
          ],
        ),
      ),
    );
  }
}
