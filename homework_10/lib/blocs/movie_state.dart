import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homework_10/models/movie.dart';
import 'package:homework_10/utils/load_status.dart';

part 'movie_state.freezed.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState({
    @Default(null) Movie? movie,
    @Default(LoadStatus.initial) LoadStatus status,
  }) = _MovieState;
}
