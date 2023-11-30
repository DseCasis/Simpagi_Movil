import 'package:flutter/material.dart';

class SavePage extends StatelessWidget {
  static const String ROUTE = '/save';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 121, 204, 118),
        title: Text("Agregar Personal"),
      ),
      body: Container(child: _FormSave()),
    );
  }
}

class _FormSave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Cédula",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Nombres", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            maxLines: 3,
            maxLength: 200,
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar datos";
              }

              return null;
            },
            decoration: InputDecoration(
                labelText: "Descripción", border: OutlineInputBorder()),
          ),
        ]),
      ),
    );
  }
}
