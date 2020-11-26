import 'dart:io';

import 'package:filmes/data/repository/movie_repository.dart';
import 'package:filmes/device/repository/movie.dart';
import 'package:filmes/domain/model/movie_model.dart';
import 'package:filmes/domain/repository/movie_interface.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class MovieUseCase implements MovieInterface {
  @override
  Future<List<MovieModel>> index() async {
    try {
      final movieApi = MovieApi();
      final movieTableHandler = MovieTableHandler();

      movieTableHandler.deleteAll();

      List<MovieModel> movies = await movieApi.index();

      for (MovieModel movie in movies) {
        await movieTableHandler.create(movie);
      }

      return movieTableHandler.selectAll();
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<String> imageCamera() async {
    final PickedFile image =
        await ImagePicker().getImage(source: ImageSource.camera);
    return image.path;
  }

  @override
  Future<String> imageGalery() async {
    final PickedFile image =
        await ImagePicker().getImage(source: ImageSource.gallery);
    return image.path;
  }

  @override
  createMovie(String name, String genre, File image) async {
    final movieApi = MovieApi();
    final movieTableHandler = MovieTableHandler();
    final movie = MovieModel(name: name, genre: genre);

    movie.id = await movieTableHandler.create(movie);
    movie.image = await movieApi.uploadImage(image);

    await movieTableHandler.update(movie);

    await movieApi.createMovie(movie);
  }

  @override
  Future<String> getBatteryLevel() async {
    const platform = const MethodChannel('samples.flutter.dev/battery');

    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      return '$result %';
    } on PlatformException catch (e) {
      throw e;
    }
  }
}
