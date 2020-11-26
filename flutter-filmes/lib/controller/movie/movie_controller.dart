import 'dart:io';

import 'package:filmes/app/page/movie_crud_page.dart';
import 'package:filmes/domain/model/movie_model.dart';
import 'package:filmes/domain/usecase/movie_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'movie_controller.g.dart';

class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  final movieUseCase = MovieUseCase();

  @observable
  ObservableList<MovieModel> _movies = new ObservableList.of([]);

  @observable
  String _image = "";

  @observable
  String _batery = "";

  @computed
  List<MovieModel> get movies => _movies.toList();

  @computed
  String get image => _image;

  @computed
  String get batery => _batery;

  final name = TextEditingController();
  final genre = TextEditingController();
  BuildContext _context;

  initState(BuildContext context) {
    _context = context;
  }

  @action
  getMovies() async {
    try {
      this._movies = ObservableList.of(await this.movieUseCase.index());
    } catch (e) {
      print(e);
    }
  }

  @action
  add() async {
    await Navigator.push(
        _context, MaterialPageRoute(builder: (context) => MovieCrudPage()));
    this.movieUseCase.index();
  }

  @action
  imageFromCamera() async {
    this._image = await this.movieUseCase.imageCamera();
  }

  @action
  imageFromGalery() async {
    this._image = await this.movieUseCase.imageGalery();
  }

  @action
  create() async {
    await this
        .movieUseCase
        .createMovie(this.name.text, this.genre.text, File(this._image));
    Navigator.pop(_context);
  }

  @action
  getBatery() async {
    this._batery = await this.movieUseCase.getBatteryLevel();
  }
}
