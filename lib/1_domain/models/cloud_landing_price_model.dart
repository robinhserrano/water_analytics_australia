// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cloud_landing_price_model.freezed.dart';
part 'cloud_landing_price_model.g.dart';

@freezed
class CloudLandingPrice with _$CloudLandingPrice {
  const factory CloudLandingPrice({
    required num installationService,
    required String internalReference,
    required String name,
    required String productCategory,
    required num supplyOnly,
  }) = _CloudLandingPrice;

  factory CloudLandingPrice.fromJson(Map<String, dynamic> json) =>
      _$CloudLandingPriceFromJson(json);

  factory CloudLandingPrice.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return CloudLandingPrice(
      installationService: doc.get('installationService') as num,
      internalReference: doc.get('internalReference') as String,
      name: doc.get('name') as String,
      productCategory: doc.get('productCategory') as String,
      supplyOnly: doc.get('supplyOnly') as num,
    );
  }
}
