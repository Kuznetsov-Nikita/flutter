import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homework_10/models/movie.dart';

part 'movie_page.g.dart';
part 'movie_page.freezed.dart';

@freezed
class MoviePage with _$MoviePage {
  const factory MoviePage({
    required Movie results,
  }) = _MoviePage;

  factory MoviePage.fromJson(Map<String, dynamic> json) => _$MoviePageFromJson(json);
}
