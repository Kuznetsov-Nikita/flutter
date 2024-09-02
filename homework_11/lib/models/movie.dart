import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.g.dart';
part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String imdbId,
    required String title,
    int? year,
    int? popularity,
    String? description,
    String? contentRating,
    int? movieLength,
    double? rating,
    String? trailer,
    String? imageUrl,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
