import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:homework_11/favourites/favourite_movies.dart';
import 'package:homework_11/models/movie_info.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('FavouriteMovies', () {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
    }
    databaseFactory = databaseFactoryFfi;
    
    late FavouriteMovies favouriteMovies;

    setUp(() async {
      favouriteMovies = FavouriteMovies();
      await favouriteMovies.initDatabase();
    });
    test('Should firstly initialize an empty database', () async {
      expect(favouriteMovies.movies.length, 0);
    });

    const testMovie = MovieInfo(imdbId: 'tt123456', title: 'Test Movie', popularity: 8);

    test('Should add a movie', () async {
      await favouriteMovies.addMovie(testMovie);

      expect(favouriteMovies.movies.length, 1);
      expect(favouriteMovies.hasMovie(testMovie), true);
    });

    test('Should save database between creations', () async {
      expect(favouriteMovies.movies.length, 1);
    });

    test('Should remove a movie', () async {
      await favouriteMovies.removeMovie(testMovie);

      expect(favouriteMovies.movies.length, 0);
      expect(favouriteMovies.hasMovie(testMovie), false);
    });

    test('Should check if a movie is in the list', () async {
      const movieInList = MovieInfo(imdbId: 'tt123456', title: 'Test Movie', popularity: 8);
      const movieNotInList = MovieInfo(imdbId: 'tt654321', title: 'Another Movie', popularity: 7);

      await favouriteMovies.addMovie(movieInList);

      expect(favouriteMovies.hasMovie(movieInList), true);
      expect(favouriteMovies.hasMovie(movieNotInList), false);

      await favouriteMovies.removeMovie(movieInList);
    });
  });
}
