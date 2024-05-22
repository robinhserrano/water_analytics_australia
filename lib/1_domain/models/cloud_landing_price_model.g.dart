// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_landing_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CloudLandingPriceImpl _$$CloudLandingPriceImplFromJson(
        Map<String, dynamic> json) =>
    _$CloudLandingPriceImpl(
      installationService: json['installationService'] as num,
      internalReference: json['internalReference'] as String,
      name: json['name'] as String,
      productCategory: json['productCategory'] as String,
      supplyOnly: json['supplyOnly'] as num,
    );

Map<String, dynamic> _$$CloudLandingPriceImplToJson(
        _$CloudLandingPriceImpl instance) =>
    <String, dynamic>{
      'installationService': instance.installationService,
      'internalReference': instance.internalReference,
      'name': instance.name,
      'productCategory': instance.productCategory,
      'supplyOnly': instance.supplyOnly,
    };
