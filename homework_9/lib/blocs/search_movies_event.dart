import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_movies_event.freezed.dart';

@freezed
class SearchMoviesEvent with _$SearchMoviesEvent {
  const factory SearchMoviesEvent.search({required String searchText}) = SearchEvent;
  const factory SearchMoviesEvent.loadMore() = LoadMoreEvent;
}
