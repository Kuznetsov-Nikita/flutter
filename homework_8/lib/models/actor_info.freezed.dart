// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actor_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActorInfo _$ActorInfoFromJson(Map<String, dynamic> json) {
  return _ActorInfo.fromJson(json);
}

/// @nodoc
mixin _$ActorInfo {
  String get imdbId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActorInfoCopyWith<ActorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActorInfoCopyWith<$Res> {
  factory $ActorInfoCopyWith(ActorInfo value, $Res Function(ActorInfo) then) =
      _$ActorInfoCopyWithImpl<$Res, ActorInfo>;
  @useResult
  $Res call({String imdbId, String name});
}

/// @nodoc
class _$ActorInfoCopyWithImpl<$Res, $Val extends ActorInfo>
    implements $ActorInfoCopyWith<$Res> {
  _$ActorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imdbId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      imdbId: null == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActorInfoImplCopyWith<$Res>
    implements $ActorInfoCopyWith<$Res> {
  factory _$$ActorInfoImplCopyWith(
          _$ActorInfoImpl value, $Res Function(_$ActorInfoImpl) then) =
      __$$ActorInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imdbId, String name});
}

/// @nodoc
class __$$ActorInfoImplCopyWithImpl<$Res>
    extends _$ActorInfoCopyWithImpl<$Res, _$ActorInfoImpl>
    implements _$$ActorInfoImplCopyWith<$Res> {
  __$$ActorInfoImplCopyWithImpl(
      _$ActorInfoImpl _value, $Res Function(_$ActorInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imdbId = null,
    Object? name = null,
  }) {
    return _then(_$ActorInfoImpl(
      imdbId: null == imdbId
          ? _value.imdbId
          : imdbId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActorInfoImpl implements _ActorInfo {
  const _$ActorInfoImpl({required this.imdbId, required this.name});

  factory _$ActorInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActorInfoImplFromJson(json);

  @override
  final String imdbId;
  @override
  final String name;

  @override
  String toString() {
    return 'ActorInfo(imdbId: $imdbId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActorInfoImpl &&
            (identical(other.imdbId, imdbId) || other.imdbId == imdbId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imdbId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActorInfoImplCopyWith<_$ActorInfoImpl> get copyWith =>
      __$$ActorInfoImplCopyWithImpl<_$ActorInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActorInfoImplToJson(
      this,
    );
  }
}

abstract class _ActorInfo implements ActorInfo {
  const factory _ActorInfo(
      {required final String imdbId,
      required final String name}) = _$ActorInfoImpl;

  factory _ActorInfo.fromJson(Map<String, dynamic> json) =
      _$ActorInfoImpl.fromJson;

  @override
  String get imdbId;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ActorInfoImplCopyWith<_$ActorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
