import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Operation {
  Future<Database> _openDB() {
    return openDatabase(join(getDatabasesPath() as String, 'notes.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT)');
    }, version: 1);
  }
}
