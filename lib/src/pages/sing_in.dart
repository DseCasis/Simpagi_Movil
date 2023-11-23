import 'package:flutter/material.dart';
import 'package:practica_1/src/widgets/icon_container.dart';
import 'package:practica_1/src/widgets/login_form.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
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
                "Login",
                style: TextStyle(
                  fontFamily: "Arial",
                  fontSize: 30.0,
                ),
              ),
              Divider(
                height: 20.0,
              ),
              Text(
                "Bienvenido al inicio de sesión",
                style: TextStyle(fontFamily: "Times New Roman", fontSize: 20.0),
              ),
              Divider(
                height: 20.0,
              ),
              //aqui llamamos a la pantalla de formulario

              LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
