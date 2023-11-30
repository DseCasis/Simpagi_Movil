import 'package:Simpagi/src/pages/save_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  static const String routeName = '/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ubicar un boton para navegar a la pagina de guardar
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Save');
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 121, 204, 118),
      ),

      //appBar
      appBar: AppBar(
        title: Text('Personal'),
        backgroundColor: Color.fromARGB(255, 121, 204, 118),
      ),
      body: Container(
          child: ListView(children: <Widget>[
        ListTile(
          title: Text('Persona 1'),
        ),
        ListTile(
          title: Text('Persona 2'),
        ),
        ListTile(
          title: Text('Persona 3'),
        ),
        ListTile(
          title: Text('Persona 4'),
        ),
        ListTile(
          title: Text('Persona 5'),
        ),
      ])),
    );
  }
}
