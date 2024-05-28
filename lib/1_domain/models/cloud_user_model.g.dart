// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CloudUserImpl _$$CloudUserImplFromJson(Map<String, dynamic> json) =>
    _$CloudUserImpl(
      accessLevel: json['accessLevel'] as num,
      commissionSplit: json['commissionSplit'] as num,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$CloudUserImplToJson(_$CloudUserImpl instance) =>
    <String, dynamic>{
      'accessLevel': instance.accessLevel,
      'commissionSplit': instance.commissionSplit,
      'displayName': instance.displayName,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
    };
