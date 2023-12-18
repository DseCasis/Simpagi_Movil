import 'package:Simpagi/src/model/notes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Operation {
  void main() {
    // Inicializa FFI
    sqfliteFfiInit();

    // Usa la implementación de FFI en lugar de la predeterminada
    databaseFactory = databaseFactoryFfi;
  }

  final databaseName = "notes.db";
  String noteTable =
      "CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT NOT NULL, content TEXT NOT NULL, createdAt TEXT DEFAULT CURRENT_TIMESTAMP)";

  //Now we must create our user table into our sqlite db

  String users =
      "create table users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrEmail TEXT UNIQUE, usrPassword TEXT)";

  //We are done in this section

  Future<Database> initDB() async {
    databaseFactory = databaseFactoryFfi;

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
      await db.execute(noteTable);
    });
  }

  //Now we create login and sign up method
  //as we create sqlite other functionality in our previous video

  //IF you didn't watch my previous videos, check part 1 and part 2

  //Login Method

  //Search Method
  Future<List<Note>> searchNotes(String keyword) async {
    final Database db = await initDB();
    List<Map<String, Object?>> searchResult = await db
        .rawQuery("select * from notes where title LIKE ?", ["%$keyword%"]);
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
  Future<int> updateNote(title, content, id) async {
    final Database db = await initDB();
    return db.rawUpdate('update notes set title = ?, content = ? where id = ?',
        [title, content, id]);
  }
}
