// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      imdbId: json['imdb_id'] as String,
      title: json['title'] as String,
      year: json['year'] as int?,
      popularity: json['popularity'] as int?,
      description: json['description'] as String?,
      contentRating: json['content_rating'] as String?,
      movieLength: json['movie_length'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      trailer: json['trailer'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'imdb_id': instance.imdbId,
      'title': instance.title,
      'year': instance.year,
      'popularity': instance.popularity,
      'description': instance.description,
      'content_rating': instance.contentRating,
      'movie_length': instance.movieLength,
      'rating': instance.rating,
      'trailer': instance.trailer,
      'image_url': instance.imageUrl,
    };
