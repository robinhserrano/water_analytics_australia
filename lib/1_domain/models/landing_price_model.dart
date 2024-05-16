// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:freezed_annotation/freezed_annotation.dart';
part 'landing_price_model.freezed.dart';
part 'landing_price_model.g.dart';

@freezed
class LandingPrice with _$LandingPrice {
  const factory LandingPrice({
    required String? name,
    required String? internalReference,
    required String? productCategory,
    required double? installationService,
    required double? supplyOnly,
  }) = _LandingPrice;

  factory LandingPrice.fromJson(Map<String, dynamic> json) =>
      _$LandingPriceFromJson(json);
}

class LandingPriceWithQuantity {
  const LandingPriceWithQuantity({
    required this.landingPrice,
    required this.quantity,
    required this.isSupplyOnly,
  });
  final LandingPrice landingPrice;
  final double quantity;
  final bool isSupplyOnly;
}
