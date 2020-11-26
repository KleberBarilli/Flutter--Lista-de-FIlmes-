import 'package:filmes/domain/model/session_model.dart';
import 'database.dart';

class SessionTableHandler {
  final DatabaseHandler database = new DatabaseHandler();

  Future<SessionModel> select() async {
    try {
      var db = await database.db;
      List<Map<String, dynamic>> list = await db.transaction((txn) async {
        return await txn.query('session');
      });

      return SessionModel.fromJson(list[0]);
    } catch (e) {
      return null;
    }
  }

  Future<bool> create(SessionModel session) async {
    try {
      var db = await database.db;
      await db.transaction((txn) async {
        return await txn.insert('session', session.toJson());
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteAll() async {
    try {
      var db = await database.db;
      await db.transaction((txn) async {
        return await txn.delete('session');
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}