// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieControllerBase, Store {
  Computed<List<MovieModel>> _$moviesComputed;

  @override
  List<MovieModel> get movies =>
      (_$moviesComputed ??= Computed<List<MovieModel>>(() => super.movies,
              name: '_MovieControllerBase.movies'))
          .value;
  Computed<String> _$imageComputed;

  @override
  String get image => (_$imageComputed ??= Computed<String>(() => super.image,
          name: '_MovieControllerBase.image'))
      .value;
  Computed<String> _$bateryComputed;

  @override
  String get batery =>
      (_$bateryComputed ??= Computed<String>(() => super.batery,
              name: '_MovieControllerBase.batery'))
          .value;

  final _$_moviesAtom = Atom(name: '_MovieControllerBase._movies');

  @override
  ObservableList<MovieModel> get _movies {
    _$_moviesAtom.reportRead();
    return super._movies;
  }

  @override
  set _movies(ObservableList<MovieModel> value) {
    _$_moviesAtom.reportWrite(value, super._movies, () {
      super._movies = value;
    });
  }

  final _$_imageAtom = Atom(name: '_MovieControllerBase._image');

  @override
  String get _image {
    _$_imageAtom.reportRead();
    return super._image;
  }

  @override
  set _image(String value) {
    _$_imageAtom.reportWrite(value, super._image, () {
      super._image = value;
    });
  }

  final _$_bateryAtom = Atom(name: '_MovieControllerBase._batery');

  @override
  String get _batery {
    _$_bateryAtom.reportRead();
    return super._batery;
  }

  @override
  set _batery(String value) {
    _$_bateryAtom.reportWrite(value, super._batery, () {
      super._batery = value;
    });
  }

  final _$getMoviesAsyncAction = AsyncAction('_MovieControllerBase.getMovies');

  @override
  Future getMovies() {
    return _$getMoviesAsyncAction.run(() => super.getMovies());
  }

  final _$addAsyncAction = AsyncAction('_MovieControllerBase.add');

  @override
  Future add() {
    return _$addAsyncAction.run(() => super.add());
  }

  final _$imageFromCameraAsyncAction =
      AsyncAction('_MovieControllerBase.imageFromCamera');

  @override
  Future imageFromCamera() {
    return _$imageFromCameraAsyncAction.run(() => super.imageFromCamera());
  }

  final _$imageFromGaleryAsyncAction =
      AsyncAction('_MovieControllerBase.imageFromGalery');

  @override
  Future imageFromGalery() {
    return _$imageFromGaleryAsyncAction.run(() => super.imageFromGalery());
  }

  final _$createAsyncAction = AsyncAction('_MovieControllerBase.create');

  @override
  Future create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$getBateryAsyncAction = AsyncAction('_MovieControllerBase.getBatery');

  @override
  Future getBatery() {
    return _$getBateryAsyncAction.run(() => super.getBatery());
  }

  @override
  String toString() {
    return '''
movies: ${movies},
image: ${image},
batery: ${batery}
    ''';
  }
}
