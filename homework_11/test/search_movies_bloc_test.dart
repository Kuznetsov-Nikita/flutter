import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homework_11/blocs/search_movies_bloc.dart';
import 'package:homework_11/blocs/search_movies_event.dart';
import 'package:homework_11/blocs/search_movies_state.dart';
import 'package:homework_11/client/movies_service.dart';
import 'package:homework_11/models/movie_info.dart';
import 'package:homework_11/models/pages/movies_list_page.dart';
import 'package:homework_11/utils/load_status.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockMoviesService extends Mock implements MoviesService {}

void main() {
  group('SearchMoviesBloc', () {
    late SearchMoviesBloc searchMoviesBloc;
    late MockMoviesService mockMoviesService;

    setUp(() {
      mockMoviesService = MockMoviesService();
      searchMoviesBloc = SearchMoviesBloc(service: mockMoviesService);
    });

    test('Should emit correct state on search event', () {
      const searchText = 'Movie';
      const searchEvent = SearchEvent(searchText: searchText);

      final searchResult = MoviesListPage(
        results: List.generate(
          20, 
          (index) => MovieInfo(imdbId: index.toString(), title: 'Movie $index'),
        ),
      );

      when(() => mockMoviesService.search(searchText)).thenAnswer(
        (_) async => 
            Future.value(Response(http.Response(searchResult.toString(), 200), searchResult)),
      );

      final expectedStates = [
        const SearchMoviesState(status: LoadStatus.loading, canLoadMore: false),
        SearchMoviesState(
          movies: searchResult.results.take(10).toList(), 
          canLoadMore: true, 
          searchText: searchText, 
          status: LoadStatus.success,
        ),
      ];

      expectLater(searchMoviesBloc.stream, emitsInOrder(expectedStates));

      searchMoviesBloc.add(searchEvent);
    });

    test('Should emit correct state on load more event', () {
      const searchText = 'Movie';
      const loadMoreEvent = LoadMoreEvent();

      final searchResult = MoviesListPage(
        results: List.generate(
          20, 
          (index) => MovieInfo(imdbId: index.toString(), title: 'Movie $index'),
        ),
      );

      when(() => mockMoviesService.search(searchText)).thenAnswer(
        (_) async => 
            Future.value(Response(http.Response(searchResult.toString(), 200), searchResult)),
      );

      searchMoviesBloc.emit(SearchMoviesState(
        movies: searchResult.results.take(10).toList(), 
        canLoadMore: true, 
        searchText: searchText, 
        status: LoadStatus.success,
      ));

      final expectedStates = [
        SearchMoviesState(
          movies: searchResult.results.take(10).toList(), 
          canLoadMore: false, 
          searchText: searchText, 
          status: LoadStatus.success,
        ),
        SearchMoviesState(
          movies: searchResult.results.take(20).toList(), 
          canLoadMore: false, 
          searchText: searchText, 
          status: LoadStatus.success,
        ),
      ];

      expectLater(searchMoviesBloc.stream, emitsInOrder(expectedStates));

      searchMoviesBloc.add(loadMoreEvent);
    });
  });
}
