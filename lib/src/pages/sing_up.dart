import 'package:flutter/material.dart';
import 'package:practica_1/src/widgets/icon_container.dart';
import 'package:practica_1/src/widgets/register_form.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Color.fromARGB(250, 32, 90, 123),
            Color.fromARGB(255, 160, 72, 112),
            Color.fromARGB(255, 145, 72, 160),
          ], begin: Alignment.topLeft)),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 200),
            children: <Widget>[
              IconContainers(url: "images/R.jpg"),
              Text(
                "Registro Usuario",
                style: TextStyle(
                  fontFamily: "Arial",
                  fontSize: 30.0,
                ),
              ),
              Divider(
                height: 20.0,
              ),
              Text(
                "Bievenido al registro de usuarios",
                style: TextStyle(fontFamily: "Times New Roman", fontSize: 20.0),
              ),
              Divider(
                height: 20.0,
              ),
              RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}
