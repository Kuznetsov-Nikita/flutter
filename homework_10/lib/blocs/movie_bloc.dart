import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_10/blocs/movie_event.dart';
import 'package:homework_10/blocs/movie_state.dart';
import 'package:homework_10/client/movies_service.dart';
import 'package:homework_10/utils/load_status.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MoviesService service;
  final String imdbId;
  
  MovieBloc({required this.service, required this.imdbId}): super(const MovieState()) {
    on<FetchEvent>(_onFetchEvent);
  }

  Future<void> _onFetchEvent(FetchEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(status: LoadStatus.loading));

    final data = await service.getMovie(imdbId);
    
    if (data.isSuccessful) {
      emit(state.copyWith(
        movie: data.body!.results,
        status: LoadStatus.success,
      ));
    } else {
      emit(state.copyWith(status: LoadStatus.failure));
    }
  }
}
