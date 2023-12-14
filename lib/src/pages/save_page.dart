import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formkey,
        child: Column(children: <Widget>[
          TextFormField(
            controller: titleController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar datos";
              }

              return null;
            },
            decoration: InputDecoration(
              labelText: "Cédula",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            keyboardType: TextInputType.name,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[0-9]'))
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar datos";
              }

              return null;
            },
            decoration: InputDecoration(
                labelText: "Nombres", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: contentController,
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
          ElevatedButton(
            child: Text('guardar'),
            onPressed: (() {
              if (_formkey.currentState!.validate()) {
                print('sus datos se han guardado correctamente');
              }
            }),
          )
        ]),
      ),
    );
  }
}
