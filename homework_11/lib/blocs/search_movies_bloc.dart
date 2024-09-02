import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_11/blocs/search_movies_event.dart';
import 'package:homework_11/blocs/search_movies_state.dart';
import 'package:homework_11/client/movies_service.dart';
import 'package:homework_11/utils/load_status.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final MoviesService service;
  
  SearchMoviesBloc({required this.service}): super(const SearchMoviesState()) {
    on<SearchEvent>(_onSearchEvent);
    on<LoadMoreEvent>(_onLoadMoreEvent);
  }

  Future<void> _onSearchEvent(SearchEvent event, Emitter<SearchMoviesState> emit) async {
    if (event.searchText.isEmpty) {
      emit(state.copyWith(movies: [], status: LoadStatus.success, canLoadMore: false));
      return;  
    }
    emit(state.copyWith(status: LoadStatus.loading, canLoadMore: false));

    final data = await service.search(event.searchText);
    
    if (data.isSuccessful) {
      emit(state.copyWith(
        movies: data.body!.results.take(10).toList(),
        canLoadMore: true,
        searchText: event.searchText,
        status: LoadStatus.success,
      ));
    } else {
      emit(state.copyWith(status: LoadStatus.failure));
    }
  }

  Future<void> _onLoadMoreEvent(LoadMoreEvent event, Emitter<SearchMoviesState> emit) async {
    emit(state.copyWith(canLoadMore: false));
    
    final data = await service.search(state.searchText);

    if (data.isSuccessful) {
      final addedMovies = data.body!.results.skip(state.movies.length).toList();
      emit(state.copyWith(
        canLoadMore: addedMovies.length > 10,
        movies: state.movies + addedMovies.take(10).toList(),
      ));
    }
  }
}
