// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_list_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoviesListPage _$MoviesListPageFromJson(Map<String, dynamic> json) {
  return _MoviesListPage.fromJson(json);
}

/// @nodoc
mixin _$MoviesListPage {
  List<MovieInfo> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviesListPageCopyWith<MoviesListPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesListPageCopyWith<$Res> {
  factory $MoviesListPageCopyWith(
          MoviesListPage value, $Res Function(MoviesListPage) then) =
      _$MoviesListPageCopyWithImpl<$Res, MoviesListPage>;
  @useResult
  $Res call({List<MovieInfo> results});
}

/// @nodoc
class _$MoviesListPageCopyWithImpl<$Res, $Val extends MoviesListPage>
    implements $MoviesListPageCopyWith<$Res> {
  _$MoviesListPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoviesListPageImplCopyWith<$Res>
    implements $MoviesListPageCopyWith<$Res> {
  factory _$$MoviesListPageImplCopyWith(_$MoviesListPageImpl value,
          $Res Function(_$MoviesListPageImpl) then) =
      __$$MoviesListPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MovieInfo> results});
}

/// @nodoc
class __$$MoviesListPageImplCopyWithImpl<$Res>
    extends _$MoviesListPageCopyWithImpl<$Res, _$MoviesListPageImpl>
    implements _$$MoviesListPageImplCopyWith<$Res> {
  __$$MoviesListPageImplCopyWithImpl(
      _$MoviesListPageImpl _value, $Res Function(_$MoviesListPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$MoviesListPageImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoviesListPageImpl implements _MoviesListPage {
  const _$MoviesListPageImpl({required final List<MovieInfo> results})
      : _results = results;

  factory _$MoviesListPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoviesListPageImplFromJson(json);

  final List<MovieInfo> _results;
  @override
  List<MovieInfo> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MoviesListPage(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesListPageImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesListPageImplCopyWith<_$MoviesListPageImpl> get copyWith =>
      __$$MoviesListPageImplCopyWithImpl<_$MoviesListPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoviesListPageImplToJson(
      this,
    );
  }
}

abstract class _MoviesListPage implements MoviesListPage {
  const factory _MoviesListPage({required final List<MovieInfo> results}) =
      _$MoviesListPageImpl;

  factory _MoviesListPage.fromJson(Map<String, dynamic> json) =
      _$MoviesListPageImpl.fromJson;

  @override
  List<MovieInfo> get results;
  @override
  @JsonKey(ignore: true)
  _$$MoviesListPageImplCopyWith<_$MoviesListPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
