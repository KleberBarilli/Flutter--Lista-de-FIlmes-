import 'package:filmes/domain/model/movie_model.dart';
import 'database.dart';

class MovieTableHandler {
  final DatabaseHandler database = new DatabaseHandler();

  Future<MovieModel> select() async {
    try {
      var db = await database.db;
      List<Map<String, dynamic>> list = await db.transaction((txn) async {
        return await txn.query('movie');
      });

      return MovieModel.fromJson(list[0]);
    } catch (e) {
      return null;
    }
  }

  Future<List<MovieModel>> selectAll() async {
    try {
      var db = await database.db;
      List<Map<String, dynamic>> list = await db.transaction((txn) async {
        return await txn.query('movie');
      });

      return list
          .map<MovieModel>((movie) => MovieModel.fromJson(movie))
          .toList();
    } catch (e) {
      return null;
    }
  }

  Future<int> create(MovieModel movie) async {
    try {
      var db = await database.db;
      int insertedId = await db.transaction((txn) async {
        return await txn.insert('movie', movie.toJson());
      });
      return insertedId;
    } catch (e) {
      throw e;
    }
  }

  Future<bool> update(MovieModel movie) async {
    try {
      var db = await database.db;
      await db.transaction((txn) async {
        return await txn.update('movie', movie.toJson(),
            where: 'id = ?', whereArgs: [movie.id]);
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
        return await txn.delete('movie');
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
