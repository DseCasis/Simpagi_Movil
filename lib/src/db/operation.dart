import 'package:Simpagi/src/model/notes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Operation {
  Database? _database;
  Future<void> initializeDatabase() async {
    _database = await _openDB();
  }

  Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), "notes.db"),
        onCreate: (db, version) {
      return db.execute("CREATE TABLE notes(title TEXT, content TEXT)");
    }, version: 1);
  }

  // Función para obtener las notas
  Future<List<Note>> notes() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> notesMap = await database.query("notes");

    return List.generate(
      notesMap.length,
      (i) => Note(
        title: notesMap[i]["title"],
        content: notesMap[i]["content"],
      ),
    );
  }

  Future<void> insertNote(Note note) async {
    Database database = await _openDB();
    await database.insert(
      "notes",
      {
        "title": note.title,
        "content": note.content,
      },
    );
  }

  static void staticMethod() {
    // Método estático
  }
}
