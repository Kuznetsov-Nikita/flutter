import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_info.g.dart';
part 'movie_info.freezed.dart';

@freezed
class MovieInfo with _$MovieInfo {
  const factory MovieInfo({
    required String imdbId,
    required String title,
    int? popularity,
  }) = _MovieInfo;

  factory MovieInfo.fromJson(Map<String, dynamic> json) => _$MovieInfoFromJson(json);
}
