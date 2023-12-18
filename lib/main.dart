import 'package:Simpagi/src/pages/home_pages.dart';
import 'package:Simpagi/src/pages/list_page.dart';
import 'package:Simpagi/src/pages/menu_lateral.dart';
import 'package:Simpagi/src/pages/save_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simpagi',
        initialRoute: "Home",
        routes: <String, WidgetBuilder>{
          "Home": (BuildContext context) => HomePage(),
          "Menu": (BuildContext context) => MenuLateral(),
          "Save": (BuildContext context) => SavePage(),
          "List": (BuildContext context) => ListPage(),
        });
  }
}