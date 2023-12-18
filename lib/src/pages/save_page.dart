import 'package:Simpagi/src/db/operation.dart';
import 'package:Simpagi/src/model/notes.dart';
import 'package:flutter/material.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<SavePage> {
  final title = TextEditingController();
  final content = TextEditingController();
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
                    title: title.text,
                    content: content.text,
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
                  controller: title,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Title is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Title"),
                  ),
                ),
                TextFormField(
                  controller: content,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Content is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Content"),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
