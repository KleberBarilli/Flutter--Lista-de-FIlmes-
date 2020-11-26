import 'dart:io';

import 'package:filmes/domain/model/movie_model.dart';

abstract class MovieInterface {
  Future<List<MovieModel>> index();
  Future<String> imageCamera();
  Future<String> imageGalery();
  createMovie(String name, String genre, File image);
  getBatteryLevel();
}