import 'package:flutter/material.dart';
import 'package:homework_9/models/movie_info.dart';

class FavouriteMovies extends ChangeNotifier {
  final List<MovieInfo> movies = [];
  
  void addMovie(MovieInfo movie) {
    movies.add(movie);
    notifyListeners();
  }

  void removeMovie(MovieInfo movie) {
    movies.remove(movie);
    notifyListeners();
  }

  bool hasMovie(MovieInfo movie) {
    return movies.indexWhere((element) => element.imdbId == movie.imdbId) != -1;
  }
}