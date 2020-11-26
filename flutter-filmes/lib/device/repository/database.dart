import 'package:filmes/device/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'dart:async';

class DatabaseHandler {
  static Database _db;

  final _versionController = {
    1: (Database db) async => {
      await db.execute(movieTable)
    }
  };

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "filmes.db");
    var theDb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return theDb;
  }

  void _onUpgrade(Database db, int a, int version) async {
    _versionController[version](db);
  }

  void _onCreate(Database db, int version) async {
    await db.execute(usuarioTable);
    await db.execute(movieTable);
  }
}
