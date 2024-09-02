import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homework_8/models/movie_info.dart';

part 'movies_list_page.g.dart';
part 'movies_list_page.freezed.dart';

@freezed
class MoviesListPage with _$MoviesListPage {
  const factory MoviesListPage({
    required List<MovieInfo> results,
  }) = _MoviesListPage;

  factory MoviesListPage.fromJson(Map<String, dynamic> json) => _$MoviesListPageFromJson(json);
}
