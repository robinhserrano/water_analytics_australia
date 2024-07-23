// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aws_landing_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AwsLandingPriceImpl _$$AwsLandingPriceImplFromJson(
        Map<String, dynamic> json) =>
    _$AwsLandingPriceImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      internalReference: json['internal_reference'] as String?,
      productCategory: json['product_category'] as String?,
      history: (json['history'] as List<dynamic>?)
          ?.map(
              (e) => AwsLandingPriceHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AwsLandingPriceImplToJson(
        _$AwsLandingPriceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'internal_reference': instance.internalReference,
      'product_category': instance.productCategory,
      'history': instance.history,
    };

_$AwsLandingPriceHistoryImpl _$$AwsLandingPriceHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$AwsLandingPriceHistoryImpl(
      id: (json['id'] as num).toInt(),
      installationService: (json['installation_service'] as num?)?.toDouble(),
      supplyOnly: (json['supply_only'] as num?)?.toDouble(),
      recordedAt: json['recorded_at'] == null
          ? null
          : DateTime.parse(json['recorded_at'] as String),
    );

Map<String, dynamic> _$$AwsLandingPriceHistoryImplToJson(
        _$AwsLandingPriceHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'installation_service': instance.installationService,
      'supply_only': instance.supplyOnly,
      'recorded_at': instance.recordedAt?.toIso8601String(),
    };
