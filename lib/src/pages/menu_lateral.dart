// ignore_for_file: prefer_const_constructors

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
        child: Center(child: Text('Contenido del proyecto')),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
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
            Padding(padding: EdgeInsets.all(14.0), child: Text("Menu")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Inicio"),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Carrito De Compras"),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Productos Favoritos"),
            )
          ],
        ),
      ),
    );
  }
}
