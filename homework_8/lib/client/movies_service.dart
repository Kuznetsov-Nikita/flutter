import 'package:chopper/chopper.dart';
import 'package:homework_8/models/pages/actors_list_page.dart';
import 'package:homework_8/models/pages/movie_page.dart';
import 'package:homework_8/models/pages/movies_list_page.dart';

part 'movies_service.chopper.dart';

@ChopperApi(baseUrl: "https://moviesminidatabase.p.rapidapi.com")
abstract class MoviesService extends ChopperService {
  static MoviesService create([ChopperClient? client]) => _$MoviesService(client);

  @Get(
    path: '/movie/order/byPopularity/', 
    headers: {
      'X-RapidAPI-Key': '147988b7b7mshb5a572649363d67p1175a5jsn5e19ed309761', 
      'X-RapidAPI-Host': 'moviesminidatabase.p.rapidapi.com'
    },
  )
  Future<Response<MoviesListPage>> getPopularMovies();

  @Get(
    path: '/movie/imdb_id/byTitle/{titlePrefix}/', 
    headers: {
      'X-RapidAPI-Key': '147988b7b7mshb5a572649363d67p1175a5jsn5e19ed309761', 
      'X-RapidAPI-Host': 'moviesminidatabase.p.rapidapi.com'
    },
  )
  Future<Response<MoviesListPage>> search(@Path() String titlePrefix);

  @Get(
    path: '/movie/id/{imdbId}/', 
    headers: {
      'X-RapidAPI-Key': '147988b7b7mshb5a572649363d67p1175a5jsn5e19ed309761', 
      'X-RapidAPI-Host': 'moviesminidatabase.p.rapidapi.com'
    },
  )
  Future<Response<MoviePage>> getMovie(@Path() String imdbId);

  @Get(
    path: '/series/order/byPopularity/', 
    headers: {
      'X-RapidAPI-Key': '147988b7b7mshb5a572649363d67p1175a5jsn5e19ed309761', 
      'X-RapidAPI-Host': 'moviesminidatabase.p.rapidapi.com'
    },
  )
  Future<Response<MoviesListPage>> getPopularSeries();

  @Get(
    path: '/actor/birthday-today/', 
    headers: {
      'X-RapidAPI-Key': '147988b7b7mshb5a572649363d67p1175a5jsn5e19ed309761', 
      'X-RapidAPI-Host': 'moviesminidatabase.p.rapidapi.com'
    },
  )
  Future<Response<ActorsListPage>> getActorsBirthdayToday();
}
