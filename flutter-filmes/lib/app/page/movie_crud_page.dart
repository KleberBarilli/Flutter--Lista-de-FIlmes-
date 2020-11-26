import 'dart:io';

import 'package:filmes/controller/movie/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MovieCrudPage extends StatefulWidget {
  @override
  _CrudCrudPageState createState() => _CrudCrudPageState();
}

class _CrudCrudPageState extends State<MovieCrudPage> {
  final movieController = MovieController();
  
  @override
  void initState() {
    Future.delayed(Duration())
        .then((value) => movieController.initState(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Novo filme"),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  movieController.create();
                }),
                 
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: movieController.name,
                  decoration: InputDecoration(
                      labelText: 'Nome', filled: true, isDense: true),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                TextField(
                  controller: movieController.genre,
                  decoration: InputDecoration(
                      labelText: 'Gênero', filled: true, isDense: true),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          movieController.imageFromCamera();
                        },
                        child: Text("Camera"),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {
                        movieController.imageFromGalery();
                      },
                      child: Text("Galeria"),
                    ))
                  ],
                ),
                Observer(
                  builder: (_) {
                    return movieController.image.isNotEmpty
                        ? Expanded(
                            child: Image.file(File(movieController.image)))
                        : Container();
                  },
                )
              ],
            )));
  }
}
