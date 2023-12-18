import 'package:Simpagi/src/db/operation.dart';
import 'package:Simpagi/src/model/notes.dart';
import 'package:Simpagi/src/pages/save_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _NotesState();
}

class _NotesState extends State<ListPage> {
  late Operation handler;
  late Future<List<Note>> notes;
  final db = Operation();

  final cedula = TextEditingController();
  final nombre = TextEditingController();
  final apellido = TextEditingController();
  final correo = TextEditingController();
  final departamento = TextEditingController();
  final cargo = TextEditingController();
  final keyword = TextEditingController();

  @override
  void initState() {
    handler = Operation();
    notes = handler.getNotes();

    handler.initDB().whenComplete(() {
      notes = getAllNotes();
    });
    super.initState();
  }

  Future<List<Note>> getAllNotes() {
    return handler.getNotes();
  }

  //Search method here
  //First we have to create a method in Database helper class
  Future<List<Note>> searchNote() {
    return handler.searchNotes(keyword.text);
  }

  //Refresh method
  Future<void> _refresh() async {
    setState(() {
      notes = getAllNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Personal"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SavePage()))
                .then((value) {
              if (value) {
                _refresh();
              }
            });
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                controller: keyword,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      notes = searchNote();
                    });
                  } else {
                    setState(() {
                      notes = getAllNotes();
                    });
                  }
                },
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                    hintText: "Buscar"),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Note>>(
                future: notes,
                builder:
                    (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return const Center(child: Text("No data"));
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    final items = snapshot.data ?? <Note>[];
                    return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(items[index].cedula),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                db
                                    .deleteNote(items[index].id!)
                                    .whenComplete(() {
                                  _refresh();
                                });
                              },
                            ),
                            onTap: () {
                              setState(() {
                                cedula.text = items[index].cedula;
                                nombre.text = items[index].nombre;
                                apellido.text = items[index].apellido;
                                correo.text = items[index].correo;
                                departamento.text = items[index].departamento;
                                cargo.text = items[index].cargo;
                              });
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      actions: [
                                        Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                //Now update method
                                                db
                                                    .updateNote(
                                                        cedula.text,
                                                        nombre.text,
                                                        apellido.text,
                                                        correo.text,
                                                        departamento.text,
                                                        cargo.text,
                                                        items[index].id)
                                                    .whenComplete(() {
                                                  _refresh();
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: const Text("Update"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Cancel"),
                                            ),
                                          ],
                                        ),
                                      ],
                                      title: const Text("Update note"),
                                      content: Column(
                                          mainAxisSize: MainAxisSize.min,
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
                                          ]),
                                    );
                                  });
                            },
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ));
  }
}
