import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homework_8/models/actor_info.dart';

part 'actors_list_page.g.dart';
part 'actors_list_page.freezed.dart';

@freezed
class ActorsListPage with _$ActorsListPage {
  const factory ActorsListPage({
    required List<ActorInfo> results,
  }) = _ActorsListPage;

  factory ActorsListPage.fromJson(Map<String, dynamic> json) => _$ActorsListPageFromJson(json);
}