import 'package:filmes/domain/model/session_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SessionApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<SessionModel> auth(String usuario, String senha) async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: usuario,
        password: senha,
      ))
          .user;

      return SessionModel(email: user.email);
    } catch (e) {
      throw e;
    }
  }
}
