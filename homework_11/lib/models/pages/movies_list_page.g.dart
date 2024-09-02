// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoviesListPageImpl _$$MoviesListPageImplFromJson(Map<String, dynamic> json) =>
    _$MoviesListPageImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MoviesListPageImplToJson(
        _$MoviesListPageImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
