// ignore_for_file: prefer_const_constructors

import 'package:Simpagi/src/pages/home_pages.dart';
import 'package:Simpagi/src/pages/list_page.dart';
import 'package:Simpagi/src/widgets/linear_carts.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simpagi"),
        backgroundColor: Color.fromARGB(255, 121, 204, 118),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: LinearCharts(),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Casis Estrada Danny Sebastian'),
              accountEmail: Text('dse.casis@yavirac.edu.ec'),
              currentAccountPicture:
                  CircleAvatar(foregroundImage: AssetImage("images/danny.jpg")),
              otherAccountsPictures: [
                CircleAvatar(foregroundImage: AssetImage("images/rell.jpg")),
                CircleAvatar(foregroundImage: AssetImage("images/zoe.jpg"))
              ],
              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 136, 14)),
            ),
            Padding(
                padding: EdgeInsets.all(14.0),
                child: Center(
                    child: Text(
                  "Opciones De Usuario",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Inicio"),
            ),
            ListTile(
              leading: Icon(Icons.person_pin),
              title: Text("Perfil"),
            ),
            ListTile(
              leading: Icon(Icons.factory),
              title: Text("Estaciones Experimentales"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Personal"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.emoji_objects),
              title: Text("Planificación"),
            ),
            ListTile(
              leading: Icon(Icons.fact_check),
              title: Text("Proyectos"),
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              title: Text(
                "Cerrar Sesión",
                style: TextStyle(color: Colors.indigo),
              ),
              onTap: () {
                decoration:
                BoxDecoration(
                  color: Colors.red,
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
