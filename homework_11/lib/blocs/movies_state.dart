import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homework_11/models/movie_info.dart';
import 'package:homework_11/utils/load_status.dart';

part 'movies_state.freezed.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState({
    @Default([]) List<MovieInfo> movies,
    @Default(true) bool canLoadMore,
    @Default(LoadStatus.initial) LoadStatus status,
  }) = _MoviesState;
}
