// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aws_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AwsUserImpl _$$AwsUserImplFromJson(Map<String, dynamic> json) =>
    _$AwsUserImpl(
      accessLevel: json['accessLevel'] as num,
      commissionSplit: json['commissionSplit'] as num,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      salesManagerId: json['salesManagerId'] as num?,
    );

Map<String, dynamic> _$$AwsUserImplToJson(_$AwsUserImpl instance) =>
    <String, dynamic>{
      'accessLevel': instance.accessLevel,
      'commissionSplit': instance.commissionSplit,
      'displayName': instance.displayName,
      'email': instance.email,
      'salesManagerId': instance.salesManagerId,
    };
