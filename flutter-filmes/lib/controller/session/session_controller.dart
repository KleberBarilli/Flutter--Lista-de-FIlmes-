import 'package:filmes/app/page/home_page.dart';
import 'package:filmes/app/page/login_page.dart';
import 'package:filmes/domain/usecase/session_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'session_controller.g.dart';

class SessionController = _SessionControllerBase with _$SessionController;

abstract class _SessionControllerBase with Store {
  final sessionUseCase = SessionUseCase();

  @observable
  bool _loading = false;

  @computed
  bool get loading => _loading;

  final usuario = TextEditingController();
  final senha = TextEditingController();
  BuildContext _context;

  initState(BuildContext context) {
    _context = context;
  }

  @action
  auth() async {
    try {
      this._loading = true;
      await this.sessionUseCase.login(usuario.text, senha.text);
      Navigator.pushAndRemoveUntil(
          _context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    } catch (e) {
      print(e);
    } finally {
      this._loading = false;
    }
  }

  @action
  logout() {
    sessionUseCase.logout();
    Navigator.pushAndRemoveUntil(_context,
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }
}
