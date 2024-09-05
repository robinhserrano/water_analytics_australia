// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RemoteConfigState {
  int get landingPriceLevel => throw _privateConstructorUsedError;

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteConfigStateCopyWith<RemoteConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigStateCopyWith<$Res> {
  factory $RemoteConfigStateCopyWith(
          RemoteConfigState value, $Res Function(RemoteConfigState) then) =
      _$RemoteConfigStateCopyWithImpl<$Res, RemoteConfigState>;
  @useResult
  $Res call({int landingPriceLevel});
}

/// @nodoc
class _$RemoteConfigStateCopyWithImpl<$Res, $Val extends RemoteConfigState>
    implements $RemoteConfigStateCopyWith<$Res> {
  _$RemoteConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? landingPriceLevel = null,
  }) {
    return _then(_value.copyWith(
      landingPriceLevel: null == landingPriceLevel
          ? _value.landingPriceLevel
          : landingPriceLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteConfigStateImplCopyWith<$Res>
    implements $RemoteConfigStateCopyWith<$Res> {
  factory _$$RemoteConfigStateImplCopyWith(_$RemoteConfigStateImpl value,
          $Res Function(_$RemoteConfigStateImpl) then) =
      __$$RemoteConfigStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int landingPriceLevel});
}

/// @nodoc
class __$$RemoteConfigStateImplCopyWithImpl<$Res>
    extends _$RemoteConfigStateCopyWithImpl<$Res, _$RemoteConfigStateImpl>
    implements _$$RemoteConfigStateImplCopyWith<$Res> {
  __$$RemoteConfigStateImplCopyWithImpl(_$RemoteConfigStateImpl _value,
      $Res Function(_$RemoteConfigStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? landingPriceLevel = null,
  }) {
    return _then(_$RemoteConfigStateImpl(
      landingPriceLevel: null == landingPriceLevel
          ? _value.landingPriceLevel
          : landingPriceLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoteConfigStateImpl implements _RemoteConfigState {
  const _$RemoteConfigStateImpl({this.landingPriceLevel = 4});

  @override
  @JsonKey()
  final int landingPriceLevel;

  @override
  String toString() {
    return 'RemoteConfigState(landingPriceLevel: $landingPriceLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigStateImpl &&
            (identical(other.landingPriceLevel, landingPriceLevel) ||
                other.landingPriceLevel == landingPriceLevel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, landingPriceLevel);

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigStateImplCopyWith<_$RemoteConfigStateImpl> get copyWith =>
      __$$RemoteConfigStateImplCopyWithImpl<_$RemoteConfigStateImpl>(
          this, _$identity);
}

abstract class _RemoteConfigState implements RemoteConfigState {
  const factory _RemoteConfigState({final int landingPriceLevel}) =
      _$RemoteConfigStateImpl;

  @override
  int get landingPriceLevel;

  /// Create a copy of RemoteConfigState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteConfigStateImplCopyWith<_$RemoteConfigStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
