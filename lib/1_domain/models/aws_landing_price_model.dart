import 'package:freezed_annotation/freezed_annotation.dart';
part 'aws_landing_price_model.freezed.dart';
part 'aws_landing_price_model.g.dart';

@freezed
class AwsLandingPrice with _$AwsLandingPrice {
  const factory AwsLandingPrice({
    required int id,
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'internal_reference') required String? internalReference,
    @JsonKey(name: 'product_category') required String? productCategory,
  }) = _AwsLandingPrice;

  factory AwsLandingPrice.fromJson(Map<String, dynamic> json) =>
      _$AwsLandingPriceFromJson(json);
}

@freezed
class AwsLandingPriceHistory with _$AwsLandingPriceHistory {
  const factory AwsLandingPriceHistory({
    required int id,
    @JsonKey(name: 'installation_service') required double? installationService,
    @JsonKey(name: 'supply_only') required double? supplyOnly,
    @JsonKey(name: 'recorded_at') required DateTime? recordedAt,
  }) = _AwsLandingPriceHistory;

  factory AwsLandingPriceHistory.fromJson(Map<String, dynamic> json) =>
      _$AwsLandingPriceHistoryFromJson(json);
}
