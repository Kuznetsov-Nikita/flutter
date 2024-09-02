import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_11/blocs/movies_event.dart';
import 'package:homework_11/blocs/movies_state.dart';
import 'package:homework_11/client/movies_service.dart';
import 'package:homework_11/models/movie_info.dart';
import 'package:homework_11/utils/load_status.dart';
import 'package:sqflite/sqflite.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesService service;
  Database? _db;
  
  MoviesBloc({required this.service}): super(const MoviesState()) {
    on<FetchEvent>(_onFetchEvent);
  }

  Future<void> _initDatabase() async {
    final dbPath = getDatabasesPath();

    _db = await openDatabase(
      '$dbPath/movies_database.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE movies(imdb_id TEXT, title TEXT, popularity INTEGER)');

        final moviesData = await service.getPopularMovies();
        if (moviesData.isSuccessful) {
          final movies = moviesData.body!.results;

          for (var movie in movies) {
            await db.insert('movies', movie.toJson());
          }
        }
      },
    );
  }

  Future<void> _onFetchEvent(FetchEvent event, Emitter<MoviesState> emit) async {
    if (_db == null) {
      await _initDatabase();
    }
    if (event.shouldLoadMore) {
      final List<Map<String, dynamic>> data = 
          await _db!.query('movies', offset: state.movies.length, limit: 10);
      final movies = data.map(
        (elem) => MovieInfo(imdbId: elem['imdb_id'] ?? '', title: elem['title'] ?? ''),
      );

      if (movies.isNotEmpty) {
        emit(state.copyWith(
          canLoadMore: movies.length == 10,
          movies: state.movies + movies.toList(),
        ));
      }
    } else {
      emit(state.copyWith(status: LoadStatus.loading));

      final List<Map<String, dynamic>> data = await _db!.query('movies', limit: 10);
      final movies = data.map(
        (elem) => MovieInfo(imdbId: elem['imdb_id'] ?? '', title: elem['title'] ?? ''),
      );
      
      if (movies.isNotEmpty) {
        emit(state.copyWith(
          movies: movies.toList(),
          canLoadMore: true,
          status: LoadStatus.success,
        ));
      } else {
        emit(state.copyWith(status: LoadStatus.failure));
      }
    }
  }
}
