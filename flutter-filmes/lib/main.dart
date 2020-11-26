import 'package:filmes/app/page/home_page.dart';
import 'package:filmes/app/page/login_page.dart';
import 'package:filmes/domain/usecase/session_usecase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

var defaultPage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final sessionUseCase = SessionUseCase();
  defaultPage = LoginPage();

  if (await sessionUseCase.isLoged()) {
    defaultPage = HomePage();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meus Filmes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: defaultPage);
  }
}
