import 'package:Simpagi/src/db/operation.dart';
import 'package:Simpagi/src/model/notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SavePage extends StatelessWidget {
  static const String ROUTE = 'Save';

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

// ignore: must_be_immutable
class _FormSave extends StatelessWidget {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  Operation operation = Operation();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: titleController,
              keyboardType: TextInputType.text,
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
                  labelText: "Titulo", border: OutlineInputBorder()),
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
                  labelText: "Contenido", border: OutlineInputBorder()),
            ),
            ElevatedButton(
              child: Text('Guardar'),
              onPressed: () async {
                await operation.initializeDatabase();

                if (_formkey.currentState!.validate()) {
                  await operation.insertNote(
                    Note(
                      title: titleController.text,
                      content: contentController.text,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Nota guardada con éxito'),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
