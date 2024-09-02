// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoviePage _$MoviePageFromJson(Map<String, dynamic> json) {
  return _MoviePage.fromJson(json);
}

/// @nodoc
mixin _$MoviePage {
  Movie get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviePageCopyWith<MoviePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviePageCopyWith<$Res> {
  factory $MoviePageCopyWith(MoviePage value, $Res Function(MoviePage) then) =
      _$MoviePageCopyWithImpl<$Res, MoviePage>;
  @useResult
  $Res call({Movie results});

  $MovieCopyWith<$Res> get results;
}

/// @nodoc
class _$MoviePageCopyWithImpl<$Res, $Val extends MoviePage>
    implements $MoviePageCopyWith<$Res> {
  _$MoviePageCopyWithImpl(this._value, this._then);

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
              as Movie,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res> get results {
    return $MovieCopyWith<$Res>(_value.results, (value) {
      return _then(_value.copyWith(results: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MoviePageImplCopyWith<$Res>
    implements $MoviePageCopyWith<$Res> {
  factory _$$MoviePageImplCopyWith(
          _$MoviePageImpl value, $Res Function(_$MoviePageImpl) then) =
      __$$MoviePageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Movie results});

  @override
  $MovieCopyWith<$Res> get results;
}

/// @nodoc
class __$$MoviePageImplCopyWithImpl<$Res>
    extends _$MoviePageCopyWithImpl<$Res, _$MoviePageImpl>
    implements _$$MoviePageImplCopyWith<$Res> {
  __$$MoviePageImplCopyWithImpl(
      _$MoviePageImpl _value, $Res Function(_$MoviePageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$MoviePageImpl(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as Movie,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoviePageImpl implements _MoviePage {
  const _$MoviePageImpl({required this.results});

  factory _$MoviePageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoviePageImplFromJson(json);

  @override
  final Movie results;

  @override
  String toString() {
    return 'MoviePage(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviePageImpl &&
            (identical(other.results, results) || other.results == results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, results);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviePageImplCopyWith<_$MoviePageImpl> get copyWith =>
      __$$MoviePageImplCopyWithImpl<_$MoviePageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoviePageImplToJson(
      this,
    );
  }
}

abstract class _MoviePage implements MoviePage {
  const factory _MoviePage({required final Movie results}) = _$MoviePageImpl;

  factory _MoviePage.fromJson(Map<String, dynamic> json) =
      _$MoviePageImpl.fromJson;

  @override
  Movie get results;
  @override
  @JsonKey(ignore: true)
  _$$MoviePageImplCopyWith<_$MoviePageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
