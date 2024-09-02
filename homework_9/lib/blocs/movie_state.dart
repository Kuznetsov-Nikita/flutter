import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homework_9/models/movie.dart';
import 'package:homework_9/utils/load_status.dart';

part 'movie_state.freezed.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState({
    @Default(null) Movie? movie,
    @Default(LoadStatus.initial) LoadStatus status,
  }) = _MovieState;
}
