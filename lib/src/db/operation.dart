import 'package:Simpagi/src/model/notes.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Operation {
  void main() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  final databaseName = "notes.db";
  String noteTable =
      "CREATE TABLE notes (id INTEGER PRIMARY KEY, cedula TEXT NOT NULL, nombre TEXT NOT NULL, apellido TEXT NOT NULL, correo TEXT NOT NULL, departamento TEXT NOT NULL, cargo TEXT NOT NULL)";

  //Now we must create our user table into our sqlite db
  //We are done in this section

  Future<Database> initDB() async {
    databaseFactory = databaseFactoryFfi;

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(noteTable);
    });
  }

  Future<List<Note>> searchNotes(String keyword) async {
    final Database db = await initDB();
    List<Map<String, Object?>> searchResult = await db
        .rawQuery("select * from notes where cedula LIKE ?", ["%$keyword%"]);
    return searchResult.map((e) => Note.fromMap(e)).toList();
  }

  //CRUD Methods

  //Create Note
  Future<int> createNote(Note note) async {
    final Database db = await initDB();
    return db.insert('notes', note.toMap());
  }

  //Get notes
  Future<List<Note>> getNotes() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('notes');
    return result.map((e) => Note.fromMap(e)).toList();
  }

  //Delete Notes
  Future<int> deleteNote(int id) async {
    final Database db = await initDB();
    return db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  //Update Notes
  Future<int> updateNote(
      cedula, nombre, apellido, correo, departamento, cargo, id) async {
    final Database db = await initDB();
    return db.rawUpdate(
        'update notes set cedula = ?, nombre = ?, apellido = ?, correo = ?, departamento = ?, cargo = ? where id = ?',
        [cedula, nombre, apellido, correo, departamento, cargo, id]);
  }
}
