// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MoviesEvent {
  bool get shouldLoadMore => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoadMore) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool shouldLoadMore)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoadMore)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchEvent value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchEvent value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchEvent value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoviesEventCopyWith<MoviesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesEventCopyWith<$Res> {
  factory $MoviesEventCopyWith(
          MoviesEvent value, $Res Function(MoviesEvent) then) =
      _$MoviesEventCopyWithImpl<$Res, MoviesEvent>;
  @useResult
  $Res call({bool shouldLoadMore});
}

/// @nodoc
class _$MoviesEventCopyWithImpl<$Res, $Val extends MoviesEvent>
    implements $MoviesEventCopyWith<$Res> {
  _$MoviesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shouldLoadMore = null,
  }) {
    return _then(_value.copyWith(
      shouldLoadMore: null == shouldLoadMore
          ? _value.shouldLoadMore
          : shouldLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchEventImplCopyWith<$Res>
    implements $MoviesEventCopyWith<$Res> {
  factory _$$FetchEventImplCopyWith(
          _$FetchEventImpl value, $Res Function(_$FetchEventImpl) then) =
      __$$FetchEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool shouldLoadMore});
}

/// @nodoc
class __$$FetchEventImplCopyWithImpl<$Res>
    extends _$MoviesEventCopyWithImpl<$Res, _$FetchEventImpl>
    implements _$$FetchEventImplCopyWith<$Res> {
  __$$FetchEventImplCopyWithImpl(
      _$FetchEventImpl _value, $Res Function(_$FetchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shouldLoadMore = null,
  }) {
    return _then(_$FetchEventImpl(
      shouldLoadMore: null == shouldLoadMore
          ? _value.shouldLoadMore
          : shouldLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FetchEventImpl implements FetchEvent {
  const _$FetchEventImpl({required this.shouldLoadMore});

  @override
  final bool shouldLoadMore;

  @override
  String toString() {
    return 'MoviesEvent.fetch(shouldLoadMore: $shouldLoadMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchEventImpl &&
            (identical(other.shouldLoadMore, shouldLoadMore) ||
                other.shouldLoadMore == shouldLoadMore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shouldLoadMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchEventImplCopyWith<_$FetchEventImpl> get copyWith =>
      __$$FetchEventImplCopyWithImpl<_$FetchEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoadMore) fetch,
  }) {
    return fetch(shouldLoadMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool shouldLoadMore)? fetch,
  }) {
    return fetch?.call(shouldLoadMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoadMore)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(shouldLoadMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchEvent value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchEvent value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchEvent value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchEvent implements MoviesEvent {
  const factory FetchEvent({required final bool shouldLoadMore}) =
      _$FetchEventImpl;

  @override
  bool get shouldLoadMore;
  @override
  @JsonKey(ignore: true)
  _$$FetchEventImplCopyWith<_$FetchEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
