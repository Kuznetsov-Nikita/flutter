// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MoviesService extends MoviesService {
  _$MoviesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MoviesService;

  @override
  Future<Response<MoviesListPage>> getPopularMovies() {
    final Uri $url = Uri.parse(
        'https://moviesminidatabase.p.rapidapi.com/movie/order/byPopularity/');
    final Map<String, String> $headers = {
      'X-RapidAPI-Key': '147988b7b7mshb5a572649363d67p1175a5jsn5e19ed309761',
      'X-RapidAPI-Host': 'moviesminidatabase.p.rapidapi.com',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<MoviesListPage, MoviesListPage>($request);
  }

  @override
  Future<Response<MoviesListPage>> search(String titlePrefix) {
    final Uri $url = Uri.parse(
        'https://moviesminidatabase.p.rapidapi.com/movie/imdb_id/byTitle/${titlePrefix}/');
    final Map<String, String> $headers = {
      'X-RapidAPI-Key': '147988b7b7mshb5a572649363d67p1175a5jsn5e19ed309761',
      'X-RapidAPI-Host': 'moviesminidatabase.p.rapidapi.com',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<MoviesListPage, MoviesListPage>($request);
  }

  @override
  Future<Response<MoviePage>> getMovie(String imdbId) {
    final Uri $url = Uri.parse(
        'https://moviesminidatabase.p.rapidapi.com/movie/id/${imdbId}/');
    final Map<String, String> $headers = {
      'X-RapidAPI-Key': '147988b7b7mshb5a572649363d67p1175a5jsn5e19ed309761',
      'X-RapidAPI-Host': 'moviesminidatabase.p.rapidapi.com',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<MoviePage, MoviePage>($request);
  }

  @override
  Future<Response<MoviesListPage>> getPopularSeries() {
    final Uri $url = Uri.parse(
        'https://moviesminidatabase.p.rapidapi.com/series/order/byPopularity/');
    final Map<String, String> $headers = {
      'X-RapidAPI-Key': '147988b7b7mshb5a572649363d67p1175a5jsn5e19ed309761',
      'X-RapidAPI-Host': 'moviesminidatabase.p.rapidapi.com',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<MoviesListPage, MoviesListPage>($request);
  }

  @override
  Future<Response<ActorsListPage>> getActorsBirthdayToday() {
    final Uri $url = Uri.parse(
        'https://moviesminidatabase.p.rapidapi.com/actor/birthday-today/');
    final Map<String, String> $headers = {
      'X-RapidAPI-Key': '147988b7b7mshb5a572649363d67p1175a5jsn5e19ed309761',
      'X-RapidAPI-Host': 'moviesminidatabase.p.rapidapi.com',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ActorsListPage, ActorsListPage>($request);
  }
}
