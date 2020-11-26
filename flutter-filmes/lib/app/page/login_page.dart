import 'package:filmes/controller/session/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final sessionController = SessionController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration())
        .then((value) => sessionController.initState(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            TextField(
              controller: sessionController.usuario,
              decoration: InputDecoration(filled: true, labelText: 'E-mail'),
            ),
            Padding(padding: EdgeInsets.all(5)),
            TextField(
              controller: sessionController.senha,
              obscureText: true,
              decoration: InputDecoration(filled: true, labelText: 'Senha'),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    if (!sessionController.loading) {
                      sessionController.auth();
                    }
                  },
                  child: Observer(
                    builder: (_) {
                      return sessionController.loading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                            )
                          : Text("Login");
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
