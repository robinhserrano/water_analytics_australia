// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LandingPriceImpl _$$LandingPriceImplFromJson(Map<String, dynamic> json) =>
    _$LandingPriceImpl(
      name: json['name'] as String?,
      internalReference: json['internalReference'] as String?,
      productCategory: json['productCategory'] as String?,
      installationService: (json['installationService'] as num?)?.toDouble(),
      supplyOnly: (json['supplyOnly'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LandingPriceImplToJson(_$LandingPriceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'internalReference': instance.internalReference,
      'productCategory': instance.productCategory,
      'installationService': instance.installationService,
      'supplyOnly': instance.supplyOnly,
    };
