import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_9/blocs/movies_event.dart';
import 'package:homework_9/blocs/movies_state.dart';
import 'package:homework_9/client/movies_service.dart';
import 'package:homework_9/utils/load_status.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesService service;
  
  MoviesBloc({required this.service}): super(const MoviesState()) {
    on<FetchEvent>(_onFetchEvent);
  }

  Future<void> _onFetchEvent(FetchEvent event, Emitter<MoviesState> emit) async {
    if (event.shouldLoadMore) {
      final data = await service.getPopularMovies();

      if (data.isSuccessful) {
        final addedMovies = data.body!.results.skip(state.movies.length).toList();
        emit(state.copyWith(
          canLoadMore: addedMovies.length > 10,
          movies: state.movies + addedMovies.take(10).toList(),
        ));
      }
    } else {
      emit(state.copyWith(status: LoadStatus.loading));

      final data = await service.getPopularMovies();
      
      if (data.isSuccessful) {
        emit(state.copyWith(
          movies: data.body!.results.take(10).toList(),
          canLoadMore: true,
          status: LoadStatus.success,
        ));
      } else {
        emit(state.copyWith(status: LoadStatus.failure));
      }
    }
  }
}
