import 'package:flutter/material.dart';
import 'package:practica_1/src/pages/sing_up.dart';
import 'package:practica_1/src/pages/sing_in.dart';
import 'package:practica_1/src/pages/home_pages.dart';
import 'package:practica_1/src/pages/menu_lateral.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Practica',
        initialRoute: "Home",
        routes: <String, WidgetBuilder>{
          "Home": (BuildContext context) => HomePage(),
          "Sing_In": (BuildContext contex) => SingIn(),
          "Sing_Up": (BuildContext context) => SingUp(),
          "Menu_Lateral": (BuildContext context) => MenuLateral(),
        });
  }
}
