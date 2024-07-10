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
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_level')
  int get accessLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'commission_split')
  num? get commissionSplit => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_manager_id')
  int? get salesManagerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'self_gen')
  double get selfGen => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_lead')
  double get companyLead => throw _privateConstructorUsedError;
  @JsonKey(name: 'plain_text')
  String? get plainText => throw _privateConstructorUsedError;

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
      {int id,
      @JsonKey(name: 'access_level') int accessLevel,
      @JsonKey(name: 'commission_split') num? commissionSplit,
      @JsonKey(name: 'name') String displayName,
      String email,
      @JsonKey(name: 'sales_manager_id') int? salesManagerId,
      @JsonKey(name: 'self_gen') double selfGen,
      @JsonKey(name: 'company_lead') double companyLead,
      @JsonKey(name: 'plain_text') String? plainText});
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
    Object? id = null,
    Object? accessLevel = null,
    Object? commissionSplit = freezed,
    Object? displayName = null,
    Object? email = null,
    Object? salesManagerId = freezed,
    Object? selfGen = null,
    Object? companyLead = null,
    Object? plainText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as int,
      commissionSplit: freezed == commissionSplit
          ? _value.commissionSplit
          : commissionSplit // ignore: cast_nullable_to_non_nullable
              as num?,
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
              as int?,
      selfGen: null == selfGen
          ? _value.selfGen
          : selfGen // ignore: cast_nullable_to_non_nullable
              as double,
      companyLead: null == companyLead
          ? _value.companyLead
          : companyLead // ignore: cast_nullable_to_non_nullable
              as double,
      plainText: freezed == plainText
          ? _value.plainText
          : plainText // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {int id,
      @JsonKey(name: 'access_level') int accessLevel,
      @JsonKey(name: 'commission_split') num? commissionSplit,
      @JsonKey(name: 'name') String displayName,
      String email,
      @JsonKey(name: 'sales_manager_id') int? salesManagerId,
      @JsonKey(name: 'self_gen') double selfGen,
      @JsonKey(name: 'company_lead') double companyLead,
      @JsonKey(name: 'plain_text') String? plainText});
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
    Object? id = null,
    Object? accessLevel = null,
    Object? commissionSplit = freezed,
    Object? displayName = null,
    Object? email = null,
    Object? salesManagerId = freezed,
    Object? selfGen = null,
    Object? companyLead = null,
    Object? plainText = freezed,
  }) {
    return _then(_$AwsUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accessLevel: null == accessLevel
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as int,
      commissionSplit: freezed == commissionSplit
          ? _value.commissionSplit
          : commissionSplit // ignore: cast_nullable_to_non_nullable
              as num?,
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
              as int?,
      selfGen: null == selfGen
          ? _value.selfGen
          : selfGen // ignore: cast_nullable_to_non_nullable
              as double,
      companyLead: null == companyLead
          ? _value.companyLead
          : companyLead // ignore: cast_nullable_to_non_nullable
              as double,
      plainText: freezed == plainText
          ? _value.plainText
          : plainText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AwsUserImpl implements _AwsUser {
  const _$AwsUserImpl(
      {required this.id,
      @JsonKey(name: 'access_level') required this.accessLevel,
      @JsonKey(name: 'commission_split') required this.commissionSplit,
      @JsonKey(name: 'name') required this.displayName,
      required this.email,
      @JsonKey(name: 'sales_manager_id') required this.salesManagerId,
      @JsonKey(name: 'self_gen') required this.selfGen,
      @JsonKey(name: 'company_lead') required this.companyLead,
      @JsonKey(name: 'plain_text') required this.plainText});

  factory _$AwsUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AwsUserImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'access_level')
  final int accessLevel;
  @override
  @JsonKey(name: 'commission_split')
  final num? commissionSplit;
  @override
  @JsonKey(name: 'name')
  final String displayName;
  @override
  final String email;
  @override
  @JsonKey(name: 'sales_manager_id')
  final int? salesManagerId;
  @override
  @JsonKey(name: 'self_gen')
  final double selfGen;
  @override
  @JsonKey(name: 'company_lead')
  final double companyLead;
  @override
  @JsonKey(name: 'plain_text')
  final String? plainText;

  @override
  String toString() {
    return 'AwsUser(id: $id, accessLevel: $accessLevel, commissionSplit: $commissionSplit, displayName: $displayName, email: $email, salesManagerId: $salesManagerId, selfGen: $selfGen, companyLead: $companyLead, plainText: $plainText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwsUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accessLevel, accessLevel) ||
                other.accessLevel == accessLevel) &&
            (identical(other.commissionSplit, commissionSplit) ||
                other.commissionSplit == commissionSplit) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.salesManagerId, salesManagerId) ||
                other.salesManagerId == salesManagerId) &&
            (identical(other.selfGen, selfGen) || other.selfGen == selfGen) &&
            (identical(other.companyLead, companyLead) ||
                other.companyLead == companyLead) &&
            (identical(other.plainText, plainText) ||
                other.plainText == plainText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, accessLevel, commissionSplit,
      displayName, email, salesManagerId, selfGen, companyLead, plainText);

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
      {required final int id,
      @JsonKey(name: 'access_level') required final int accessLevel,
      @JsonKey(name: 'commission_split') required final num? commissionSplit,
      @JsonKey(name: 'name') required final String displayName,
      required final String email,
      @JsonKey(name: 'sales_manager_id') required final int? salesManagerId,
      @JsonKey(name: 'self_gen') required final double selfGen,
      @JsonKey(name: 'company_lead') required final double companyLead,
      @JsonKey(name: 'plain_text')
      required final String? plainText}) = _$AwsUserImpl;

  factory _AwsUser.fromJson(Map<String, dynamic> json) = _$AwsUserImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'access_level')
  int get accessLevel;
  @override
  @JsonKey(name: 'commission_split')
  num? get commissionSplit;
  @override
  @JsonKey(name: 'name')
  String get displayName;
  @override
  String get email;
  @override
  @JsonKey(name: 'sales_manager_id')
  int? get salesManagerId;
  @override
  @JsonKey(name: 'self_gen')
  double get selfGen;
  @override
  @JsonKey(name: 'company_lead')
  double get companyLead;
  @override
  @JsonKey(name: 'plain_text')
  String? get plainText;
  @override
  @JsonKey(ignore: true)
  _$$AwsUserImplCopyWith<_$AwsUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
