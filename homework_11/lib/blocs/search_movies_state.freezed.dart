// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchMoviesState {
  List<MovieInfo> get movies => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  LoadStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchMoviesStateCopyWith<SearchMoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchMoviesStateCopyWith<$Res> {
  factory $SearchMoviesStateCopyWith(
          SearchMoviesState value, $Res Function(SearchMoviesState) then) =
      _$SearchMoviesStateCopyWithImpl<$Res, SearchMoviesState>;
  @useResult
  $Res call(
      {List<MovieInfo> movies,
      String searchText,
      bool canLoadMore,
      LoadStatus status});
}

/// @nodoc
class _$SearchMoviesStateCopyWithImpl<$Res, $Val extends SearchMoviesState>
    implements $SearchMoviesStateCopyWith<$Res> {
  _$SearchMoviesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? searchText = null,
    Object? canLoadMore = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieInfo>,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchMoviesStateImplCopyWith<$Res>
    implements $SearchMoviesStateCopyWith<$Res> {
  factory _$$SearchMoviesStateImplCopyWith(_$SearchMoviesStateImpl value,
          $Res Function(_$SearchMoviesStateImpl) then) =
      __$$SearchMoviesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MovieInfo> movies,
      String searchText,
      bool canLoadMore,
      LoadStatus status});
}

/// @nodoc
class __$$SearchMoviesStateImplCopyWithImpl<$Res>
    extends _$SearchMoviesStateCopyWithImpl<$Res, _$SearchMoviesStateImpl>
    implements _$$SearchMoviesStateImplCopyWith<$Res> {
  __$$SearchMoviesStateImplCopyWithImpl(_$SearchMoviesStateImpl _value,
      $Res Function(_$SearchMoviesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? searchText = null,
    Object? canLoadMore = null,
    Object? status = null,
  }) {
    return _then(_$SearchMoviesStateImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieInfo>,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
    ));
  }
}

/// @nodoc

class _$SearchMoviesStateImpl implements _SearchMoviesState {
  const _$SearchMoviesStateImpl(
      {final List<MovieInfo> movies = const [],
      this.searchText = '',
      this.canLoadMore = false,
      this.status = LoadStatus.success})
      : _movies = movies;

  final List<MovieInfo> _movies;
  @override
  @JsonKey()
  List<MovieInfo> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final String searchText;
  @override
  @JsonKey()
  final bool canLoadMore;
  @override
  @JsonKey()
  final LoadStatus status;

  @override
  String toString() {
    return 'SearchMoviesState(movies: $movies, searchText: $searchText, canLoadMore: $canLoadMore, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchMoviesStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      searchText,
      canLoadMore,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchMoviesStateImplCopyWith<_$SearchMoviesStateImpl> get copyWith =>
      __$$SearchMoviesStateImplCopyWithImpl<_$SearchMoviesStateImpl>(
          this, _$identity);
}

abstract class _SearchMoviesState implements SearchMoviesState {
  const factory _SearchMoviesState(
      {final List<MovieInfo> movies,
      final String searchText,
      final bool canLoadMore,
      final LoadStatus status}) = _$SearchMoviesStateImpl;

  @override
  List<MovieInfo> get movies;
  @override
  String get searchText;
  @override
  bool get canLoadMore;
  @override
  LoadStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$SearchMoviesStateImplCopyWith<_$SearchMoviesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
