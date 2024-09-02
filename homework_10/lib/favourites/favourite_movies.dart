import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework_10/models/movie_info.dart';
import 'package:sqflite/sqflite.dart';

class FavouriteMovies extends ChangeNotifier {
  List<MovieInfo> movies = [];
  late final Database _db;

  Future<void> initDatabase() async {
    final dbPath = getDatabasesPath();

    _db = await openDatabase(
      '$dbPath/favourite_movies_database.db',
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favourite_movies(imdb_id TEXT, title TEXT, popularity INTEGER)',
        );
      },
    );

    final List<Map<String, dynamic>> data = await _db.query('favourite_movies');
    movies = data.map((elem) => MovieInfo(imdbId: elem['imdb_id'], title: elem['title'])).toList();
  }

  Future<void> addMovie(MovieInfo movie) async {
    movies.add(movie);
    await _db.insert('favourite_movies', movie.toJson());
    notifyListeners();
  }

  Future<void> removeMovie(MovieInfo movie) async {
    movies.remove(movie);
    await _db.delete('favourite_movies', where: 'imdb_id = ?', whereArgs: [movie.imdbId]);
    notifyListeners();
  }

  bool hasMovie(MovieInfo movie) {
    return movies.indexWhere((element) => element.imdbId == movie.imdbId) != -1;
  }
}