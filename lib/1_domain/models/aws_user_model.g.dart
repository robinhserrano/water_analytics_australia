// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aws_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AwsUserImpl _$$AwsUserImplFromJson(Map<String, dynamic> json) =>
    _$AwsUserImpl(
      id: (json['id'] as num).toInt(),
      accessLevel: (json['access_level'] as num).toInt(),
      commissionSplit: json['commission_split'] as num?,
      displayName: json['name'] as String,
      email: json['email'] as String,
      salesManagerId: (json['sales_manager_id'] as num?)?.toInt(),
      selfGen: (json['self_gen'] as num).toDouble(),
      companyLead: (json['company_lead'] as num).toDouble(),
      plainText: json['plain_text'] as String?,
    );

Map<String, dynamic> _$$AwsUserImplToJson(_$AwsUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'access_level': instance.accessLevel,
      'commission_split': instance.commissionSplit,
      'name': instance.displayName,
      'email': instance.email,
      'sales_manager_id': instance.salesManagerId,
      'self_gen': instance.selfGen,
      'company_lead': instance.companyLead,
      'plain_text': instance.plainText,
    };
