// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_list_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActorsListPageImpl _$$ActorsListPageImplFromJson(Map<String, dynamic> json) =>
    _$ActorsListPageImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => ActorInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ActorsListPageImplToJson(
        _$ActorsListPageImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
