import 'package:Simpagi/src/db/operation.dart';
import 'package:Simpagi/src/model/notes.dart';
import 'package:flutter/material.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<SavePage> {
  final cedula = TextEditingController();
  final nombre = TextEditingController();
  final apellido = TextEditingController();
  final correo = TextEditingController();
  final departamento = TextEditingController();
  final cargo = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final db = Operation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create note"),
        actions: [
          IconButton(
              onPressed: () {
                //Add Note button
                //We should not allow empty data to the database
                if (formKey.currentState!.validate()) {
                  db
                      .createNote(Note(
                    cedula: cedula.text,
                    nombre: nombre.text,
                    apellido: apellido.text,
                    correo: correo.text,
                    departamento: departamento.text,
                    cargo: cargo.text,
                  ))
                      .whenComplete(() {
                    //When this value is true
                    Navigator.of(context).pop(true);
                  });
                }
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Form(
          //I forgot to specify key
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: cedula,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Cedula is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Cedula"),
                  ),
                ),
                TextFormField(
                  controller: nombre,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nombre is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Nombre"),
                  ),
                ),
                TextFormField(
                  controller: apellido,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Apellido is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Apellido"),
                  ),
                ),
                TextFormField(
                  controller: correo,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Correo is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Correo"),
                  ),
                ),
                TextFormField(
                  controller: departamento,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Departamento is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Departamento"),
                  ),
                ),
                TextFormField(
                  controller: cargo,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Cargo is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Cargo"),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
