abstract class SessionInterface {
  login(String usuario, String senha);
  logout();
  Future<bool> isLoged();
}