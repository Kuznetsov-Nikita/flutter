// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieInfoImpl _$$MovieInfoImplFromJson(Map<String, dynamic> json) =>
    _$MovieInfoImpl(
      imdbId: json['imdb_id'] as String,
      title: json['title'] as String,
      popularity: json['popularity'] as int?,
    );

Map<String, dynamic> _$$MovieInfoImplToJson(_$MovieInfoImpl instance) =>
    <String, dynamic>{
      'imdb_id': instance.imdbId,
      'title': instance.title,
      'popularity': instance.popularity,
    };
