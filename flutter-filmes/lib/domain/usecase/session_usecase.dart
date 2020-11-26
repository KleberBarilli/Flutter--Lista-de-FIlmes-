import 'package:filmes/data/repository/session_repository.dart';
import 'package:filmes/device/repository/session.dart';
import 'package:filmes/domain/model/session_model.dart';
import 'package:filmes/domain/repository/session_interface.dart';

class SessionUseCase implements SessionInterface {
  @override
  login(String usuario, String senha) async {
    try {
      final sessionApi = SessionApi();
      final sessionTableHandler = SessionTableHandler();

      final session = await sessionApi.auth(usuario, senha);
      await sessionTableHandler.deleteAll();
      await sessionTableHandler.create(session);
    } catch (e) {
      throw e;
    }
  }

  @override
  logout() async {
    final sessionTableHandler = SessionTableHandler();
    await sessionTableHandler.deleteAll();
  }

  @override
  Future<bool> isLoged() async {
    final sessionTableHandler = SessionTableHandler();
    SessionModel session = await sessionTableHandler.select();
    return session?.email?.isNotEmpty ?? false;
  }
}
