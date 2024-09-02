import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_event.freezed.dart';

@freezed
class MoviesEvent with _$MoviesEvent {
  const factory MoviesEvent.fetch({required bool shouldLoadMore}) = FetchEvent;
}
