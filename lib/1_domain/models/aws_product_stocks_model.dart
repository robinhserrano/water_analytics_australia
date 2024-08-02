// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
part 'aws_product_stocks_model.freezed.dart';
part 'aws_product_stocks_model.g.dart';

@freezed
class AwsProductStocks with _$AwsProductStocks {
  const factory AwsProductStocks({
    required int id,
    @JsonKey(name: 'display_name') required String? displayName,
    @JsonKey(name: 'categ_name') required String? categName,
    @JsonKey(name: 'avg_cost') required double? avgCost,
    @JsonKey(name: 'total_value') required double? totalValue,
    @JsonKey(name: 'qty_available') required double? qtyAvailable,
    @JsonKey(name: 'free_qty') required double? freeQty,
    @JsonKey(name: 'incoming_qty') required double? incomingQty,
    @JsonKey(name: 'outgoing_qty') required double? outgoingQty,
    @JsonKey(name: 'virtual_available') required double? virtualAvailable,
    @JsonKey(name: 'warehouse_id') required int? warehouseId,
  }) = _AwsProductStocks;

  factory AwsProductStocks.fromJson(Map<String, dynamic> json) =>
      _$AwsProductStocksFromJson(json);
}

@freezed
class CurrentWarehouse with _$CurrentWarehouse {
  const factory CurrentWarehouse({
    @JsonKey(name: 'warehouse_id') required int warehouseId,
    required String? name,
    required String? code,
  }) = _CurrentWarehouse;

  factory CurrentWarehouse.fromJson(Map<String, dynamic> json) =>
      _$CurrentWarehouseFromJson(json);
}
