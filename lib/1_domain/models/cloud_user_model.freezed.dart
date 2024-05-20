// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CloudUser _$CloudUserFromJson(Map<String, dynamic> json) {
  return _CloudUser.fromJson(json);
}

/// @nodoc
mixin _$CloudUser {
  int get accessLevel => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloudUserCopyWith<CloudUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudUserCopyWith<$Res> {
  factory $CloudUserCopyWith(CloudUser value, $Res Function(CloudUser) then) =
      _$CloudUserCopyWithImpl<$Res, CloudUser>;
  @useResult
  $Res call(
      {int accessLevel, String displayName, String email, String? photoUrl});
}

/// @nodoc
class _$CloudUserCopyWithImpl<$Res, $Val extends CloudUser>
    implements $CloudUserCopyWith<$Res> {
  _$CloudUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessLevel = null,
    Object? displayName = null,
    Object? email = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CloudUserImplCopyWith<$Res>
    implements $CloudUserCopyWith<$Res> {
  factory _$$CloudUserImplCopyWith(
          _$CloudUserImpl value, $Res Function(_$CloudUserImpl) then) =
      __$$CloudUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int accessLevel, String displayName, String email, String? photoUrl});
}

/// @nodoc
class __$$CloudUserImplCopyWithImpl<$Res>
    extends _$CloudUserCopyWithImpl<$Res, _$CloudUserImpl>
    implements _$$CloudUserImplCopyWith<$Res> {
  __$$CloudUserImplCopyWithImpl(
      _$CloudUserImpl _value, $Res Function(_$CloudUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessLevel = null,
    Object? displayName = null,
    Object? email = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_$CloudUserImpl(
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CloudUserImpl implements _CloudUser {
  const _$CloudUserImpl(
      {required this.accessLevel,
      required this.displayName,
      required this.email,
      required this.photoUrl});

  factory _$CloudUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$CloudUserImplFromJson(json);

  @override
  final int accessLevel;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'CloudUser(accessLevel: $accessLevel, displayName: $displayName, email: $email, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudUserImpl &&
            (identical(other.accessLevel, accessLevel) ||
                other.accessLevel == accessLevel) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessLevel, displayName, email, photoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudUserImplCopyWith<_$CloudUserImpl> get copyWith =>
      __$$CloudUserImplCopyWithImpl<_$CloudUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CloudUserImplToJson(
      this,
    );
  }
}

abstract class _CloudUser implements CloudUser {
  const factory _CloudUser(
      {required final int accessLevel,
      required final String displayName,
      required final String email,
      required final String? photoUrl}) = _$CloudUserImpl;

  factory _CloudUser.fromJson(Map<String, dynamic> json) =
      _$CloudUserImpl.fromJson;

  @override
  int get accessLevel;
  @override
  String get displayName;
  @override
  String get email;
  @override
  String? get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$CloudUserImplCopyWith<_$CloudUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
