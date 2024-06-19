// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aws_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AwsUser _$AwsUserFromJson(Map<String, dynamic> json) {
  return _AwsUser.fromJson(json);
}

/// @nodoc
mixin _$AwsUser {
  num get accessLevel => throw _privateConstructorUsedError;
  num get commissionSplit => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  num? get salesManagerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AwsUserCopyWith<AwsUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwsUserCopyWith<$Res> {
  factory $AwsUserCopyWith(AwsUser value, $Res Function(AwsUser) then) =
      _$AwsUserCopyWithImpl<$Res, AwsUser>;
  @useResult
  $Res call(
      {num accessLevel,
      num commissionSplit,
      String displayName,
      String email,
      num? salesManagerId});
}

/// @nodoc
class _$AwsUserCopyWithImpl<$Res, $Val extends AwsUser>
    implements $AwsUserCopyWith<$Res> {
  _$AwsUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessLevel = null,
    Object? commissionSplit = null,
    Object? displayName = null,
    Object? email = null,
    Object? salesManagerId = freezed,
  }) {
    return _then(_value.copyWith(
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as num,
      commissionSplit: null == commissionSplit
          ? _value.commissionSplit
          : commissionSplit // ignore: cast_nullable_to_non_nullable
              as num,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      salesManagerId: freezed == salesManagerId
          ? _value.salesManagerId
          : salesManagerId // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AwsUserImplCopyWith<$Res> implements $AwsUserCopyWith<$Res> {
  factory _$$AwsUserImplCopyWith(
          _$AwsUserImpl value, $Res Function(_$AwsUserImpl) then) =
      __$$AwsUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num accessLevel,
      num commissionSplit,
      String displayName,
      String email,
      num? salesManagerId});
}

/// @nodoc
class __$$AwsUserImplCopyWithImpl<$Res>
    extends _$AwsUserCopyWithImpl<$Res, _$AwsUserImpl>
    implements _$$AwsUserImplCopyWith<$Res> {
  __$$AwsUserImplCopyWithImpl(
      _$AwsUserImpl _value, $Res Function(_$AwsUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessLevel = null,
    Object? commissionSplit = null,
    Object? displayName = null,
    Object? email = null,
    Object? salesManagerId = freezed,
  }) {
    return _then(_$AwsUserImpl(
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as num,
      commissionSplit: null == commissionSplit
          ? _value.commissionSplit
          : commissionSplit // ignore: cast_nullable_to_non_nullable
              as num,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      salesManagerId: freezed == salesManagerId
          ? _value.salesManagerId
          : salesManagerId // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AwsUserImpl implements _AwsUser {
  const _$AwsUserImpl(
      {required this.accessLevel,
      required this.commissionSplit,
      required this.displayName,
      required this.email,
      required this.salesManagerId});

  factory _$AwsUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AwsUserImplFromJson(json);

  @override
  final num accessLevel;
  @override
  final num commissionSplit;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final num? salesManagerId;

  @override
  String toString() {
    return 'AwsUser(accessLevel: $accessLevel, commissionSplit: $commissionSplit, displayName: $displayName, email: $email, salesManagerId: $salesManagerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwsUserImpl &&
            (identical(other.accessLevel, accessLevel) ||
                other.accessLevel == accessLevel) &&
            (identical(other.commissionSplit, commissionSplit) ||
                other.commissionSplit == commissionSplit) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.salesManagerId, salesManagerId) ||
                other.salesManagerId == salesManagerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessLevel, commissionSplit,
      displayName, email, salesManagerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AwsUserImplCopyWith<_$AwsUserImpl> get copyWith =>
      __$$AwsUserImplCopyWithImpl<_$AwsUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AwsUserImplToJson(
      this,
    );
  }
}

abstract class _AwsUser implements AwsUser {
  const factory _AwsUser(
      {required final num accessLevel,
      required final num commissionSplit,
      required final String displayName,
      required final String email,
      required final num? salesManagerId}) = _$AwsUserImpl;

  factory _AwsUser.fromJson(Map<String, dynamic> json) = _$AwsUserImpl.fromJson;

  @override
  num get accessLevel;
  @override
  num get commissionSplit;
  @override
  String get displayName;
  @override
  String get email;
  @override
  num? get salesManagerId;
  @override
  @JsonKey(ignore: true)
  _$$AwsUserImplCopyWith<_$AwsUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
