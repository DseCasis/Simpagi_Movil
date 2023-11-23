// ignore: file_names
import 'package:flutter/material.dart';
import 'package:practica_1/src/pages/sing_up.dart';
// ignore: unused_import
import 'package:practica_1/src/widgets/icon_container.dart';
import 'package:practica_1/src/pages/sing_in.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(210, 253, 209, 255),
            Color.fromARGB(255, 145, 72, 25),
          ], begin: Alignment.topLeft)),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 200),
            children: <Widget>[
              IconContainers(url: "images/R.jpg"),
              Text(
                "Bienvenidos",
                style: TextStyle(
                  fontFamily: "Arial",
                  fontSize: 30.0,
                ),
              ),
              Divider(
                height: 20.0,
              ),
              Text(
                "data",
                style: TextStyle(fontFamily: "Times New Roman", fontSize: 20.0),
              ),
              Divider(
                height: 20.0,
              ),
              SizedBox(
                width: 300.0,
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () {
                    final route =
                        MaterialPageRoute(builder: (context) => SingIn());
                    Navigator.push(context, route);
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Arial",
                        fontSize: 30.0),
                  ),
                ),
              ),
              Divider(
                height: 20.0,
              ),
              SizedBox(
                width: 300.0,
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () {
                    final route =
                        MaterialPageRoute(builder: (context) => SingUp());
                    Navigator.push(context, route);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Arial",
                        fontSize: 30.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
