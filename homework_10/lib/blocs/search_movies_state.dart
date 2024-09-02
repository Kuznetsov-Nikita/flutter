import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homework_10/models/movie_info.dart';
import 'package:homework_10/utils/load_status.dart';

part 'search_movies_state.freezed.dart';

@freezed
class SearchMoviesState with _$SearchMoviesState {
  const factory SearchMoviesState({
    @Default([]) List<MovieInfo> movies,
    @Default('') String searchText,
    @Default(false) bool canLoadMore,
    @Default(LoadStatus.success) LoadStatus status,
  }) = _SearchMoviesState;
}
