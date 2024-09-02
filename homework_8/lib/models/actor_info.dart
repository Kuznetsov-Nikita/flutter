import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor_info.g.dart';
part 'actor_info.freezed.dart';

@freezed
class ActorInfo with _$ActorInfo {
  const factory ActorInfo({
    required String imdbId,
    required String name,
  }) = _ActorInfo;

  factory ActorInfo.fromJson(Map<String, dynamic> json) => _$ActorInfoFromJson(json);
}
