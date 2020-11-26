import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmes/domain/model/movie_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class MovieApi {
  final Query query = FirebaseFirestore.instance.collection('filmes');

  Future<List<MovieModel>> index() async {
    try {
      final response = await query.get();

      return response.docs.map((filme) {
        return MovieModel.fromJson({...filme.data()});
      }).toList();
    } catch (e) {
      throw e;
    }
  }

  Future<String> uploadImage(File image) async {
    Reference storageReference =
        FirebaseStorage.instance.ref().child('filmes/${basename(image.path)}');
    UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask;
    return await storageReference.getDownloadURL();
  }

  createMovie(MovieModel movie) async {
    await FirebaseFirestore.instance
        .collection('filmes')
        .doc('filme_${movie.id}')
        .set(movie.toJson());
  }
}
