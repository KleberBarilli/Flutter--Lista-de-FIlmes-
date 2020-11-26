import 'package:filmes/controller/movie/movie_controller.dart';
import 'package:filmes/controller/session/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final movieController = MovieController();
  final sessionController = SessionController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration()).then((value) {
      movieController.initState(context);
      sessionController.initState(context);
    });
    movieController.getMovies();
    movieController.getBatery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmes"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                movieController.add();
              }),
          IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                sessionController.logout();
              })
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 60,
              color: Colors.blue.withOpacity(0.4),
              child: Center(child: Observer(builder: (_) {
                return Text("Nível da baterial: ${movieController.batery}");
              }))),
          Expanded(
            child: Observer(builder: (_) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 60,
                            color: Colors.red.withOpacity(0.4),
                            child: Center(
                              child: Text(
                                movieController.movies[index].name,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          movieController.movies[index].image.isNotEmpty
                              ? Expanded(
                                  child: Image.network(
                                  movieController.movies[index].image,
                                  fit: BoxFit.fill,
                                ))
                              : Container()
                        ],
                      ),
                    ),
                  );
                },
                itemCount: movieController.movies.length,
              );
            }),
          )
        ],
      )),
    );
  }
}
