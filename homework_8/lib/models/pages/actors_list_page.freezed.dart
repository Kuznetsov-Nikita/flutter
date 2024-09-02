// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actors_list_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActorsListPage _$ActorsListPageFromJson(Map<String, dynamic> json) {
  return _ActorsListPage.fromJson(json);
}

/// @nodoc
mixin _$ActorsListPage {
  List<ActorInfo> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActorsListPageCopyWith<ActorsListPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActorsListPageCopyWith<$Res> {
  factory $ActorsListPageCopyWith(
          ActorsListPage value, $Res Function(ActorsListPage) then) =
      _$ActorsListPageCopyWithImpl<$Res, ActorsListPage>;
  @useResult
  $Res call({List<ActorInfo> results});
}

/// @nodoc
class _$ActorsListPageCopyWithImpl<$Res, $Val extends ActorsListPage>
    implements $ActorsListPageCopyWith<$Res> {
  _$ActorsListPageCopyWithImpl(this._value, this._then);

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
              as List<ActorInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActorsListPageImplCopyWith<$Res>
    implements $ActorsListPageCopyWith<$Res> {
  factory _$$ActorsListPageImplCopyWith(_$ActorsListPageImpl value,
          $Res Function(_$ActorsListPageImpl) then) =
      __$$ActorsListPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ActorInfo> results});
}

/// @nodoc
class __$$ActorsListPageImplCopyWithImpl<$Res>
    extends _$ActorsListPageCopyWithImpl<$Res, _$ActorsListPageImpl>
    implements _$$ActorsListPageImplCopyWith<$Res> {
  __$$ActorsListPageImplCopyWithImpl(
      _$ActorsListPageImpl _value, $Res Function(_$ActorsListPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$ActorsListPageImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ActorInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActorsListPageImpl implements _ActorsListPage {
  const _$ActorsListPageImpl({required final List<ActorInfo> results})
      : _results = results;

  factory _$ActorsListPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActorsListPageImplFromJson(json);

  final List<ActorInfo> _results;
  @override
  List<ActorInfo> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'ActorsListPage(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActorsListPageImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActorsListPageImplCopyWith<_$ActorsListPageImpl> get copyWith =>
      __$$ActorsListPageImplCopyWithImpl<_$ActorsListPageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActorsListPageImplToJson(
      this,
    );
  }
}

abstract class _ActorsListPage implements ActorsListPage {
  const factory _ActorsListPage({required final List<ActorInfo> results}) =
      _$ActorsListPageImpl;

  factory _ActorsListPage.fromJson(Map<String, dynamic> json) =
      _$ActorsListPageImpl.fromJson;

  @override
  List<ActorInfo> get results;
  @override
  @JsonKey(ignore: true)
  _$$ActorsListPageImplCopyWith<_$ActorsListPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
