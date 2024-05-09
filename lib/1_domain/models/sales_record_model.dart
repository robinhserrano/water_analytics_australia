// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:water_analytics_australia/core/bool_string_converter.dart';
part 'sales_record_model.freezed.dart';
part 'sales_record_model.g.dart';

@freezed
class SalesOrder with _$SalesOrder {
  const factory SalesOrder({
    required int? id,
    required String? name, //A
    @JsonKey(name: 'create_date') required DateTime? createDate, //B
    @JsonKey(name: 'partner_id') required PartnerIdModel? partnerId, //C-E
    @JsonKey(name: 'x_studio_sales_rep_1') required String xStudioSalesRep1, //F
    @JsonKey(name: 'x_studio_sales_source')
    required String xStudioSalesSource, //G
    @JsonKey(name: 'x_studio_commission_paid')
    required bool xStudioCommissionPaid, //H,
    @JsonKey(name: 'x_studio_referred_by')
    @BoolRefferedByConverter()
    required DisplayNameModel xStudioReferredBy,
    @JsonKey(name: 'x_studio_referrer_processed')
    required bool xStudioReferrerProcessed, //J,
    @JsonKey(name: 'x_studio_payment_type')
    required String xStudioPaymentType, //K
    @JsonKey(name: 'amount_total') required double? amountTotal, // L
    @JsonKey(name: 'delivery_status') required dynamic deliveryStatus, //M
    @JsonKey(name: 'amount_to_invoice') required double? amountToInvoice, //N
    @JsonKey(name: 'x_studio_invoice_payment_status')
    required dynamic xStudioInvoicePaymentStatus, //O
    @JsonKey(name: 'internal_note_display') //P
    required String? internalNoteDisplay,
    required String? state,
    @JsonKey(name: 'user_id')
    @BoolRefferedByConverter()
    required DisplayNameModel? userId,
    @JsonKey(name: 'team_id')
    @BoolRefferedByConverter()
    required DisplayNameModel? teamId,
    @JsonKey(name: 'order_line') required List<OrderLine>? orderLine,
    @JsonKey(name: 'tag_ids') required List<TagIdModel>? tagIds,
    @JsonKey(name: 'tax_totals') required TaxTotalsModel? taxTotals,
  }) = _SalesOrder;

  factory SalesOrder.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderFromJson(json);
}

@freezed
class OrderLine with _$OrderLine {
  const factory OrderLine({
    @JsonKey(name: 'product_template_id')
    required DisplayNameModel? productTemplateId, //B
    @JsonKey(name: 'name') required String? name, //C-E
    @JsonKey(name: 'product_uom_qty') required double? productUomQty, //F
    @JsonKey(name: 'qty_delivered') required double? qtyDelivered, //G
    @JsonKey(name: 'qty_invoiced') required double? qtyInvoiced, //H,
    @JsonKey(name: 'price_unit') required double? priceUnit,
    @JsonKey(name: 'tax_id') required List<DisplayNameModel>? taxId, //J,
    @JsonKey(name: 'discount') required double? discount, //K
    @JsonKey(name: 'price_subtotal') required double? priceSubtotal, // L
  }) = _OrderLine;

  factory OrderLine.fromJson(Map<String, dynamic> json) =>
      _$OrderLineFromJson(json);
}

@freezed
class PartnerIdModel with _$PartnerIdModel {
  const factory PartnerIdModel({
    @JsonKey(name: 'display_name') required String? displayName,
    @JsonKey(name: 'contact_address') required dynamic contactAddress,
    @JsonKey(name: 'phone') required dynamic phone,
  }) = _PartnerIdModel;

  factory PartnerIdModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerIdModelFromJson(json);
}

@freezed
class DisplayNameModel with _$DisplayNameModel {
  const factory DisplayNameModel({
    @JsonKey(name: 'display_name') required String? displayName,
  }) = _DisplayNameModel;

  factory DisplayNameModel.fromJson(Map<String, dynamic> json) =>
      _$DisplayNameModelFromJson(json);
}

@freezed
class TagIdModel with _$TagIdModel {
  const factory TagIdModel({
    @JsonKey(name: 'display_name') required String? displayName,
    @JsonKey(name: 'color') required int? color,
  }) = _TagIdModel;

  factory TagIdModel.fromJson(Map<String, dynamic> json) =>
      _$TagIdModelFromJson(json);
}

@freezed
class TaxTotalsModel with _$TaxTotalsModel {
  const factory TaxTotalsModel({
    @JsonKey(name: 'amount_untaxed') required double? amountUntaxed,
    @JsonKey(name: 'amount_total') required double? amountTotal,
  }) = _TaxTotalsModel;

  factory TaxTotalsModel.fromJson(Map<String, dynamic> json) =>
      _$TaxTotalsModelFromJson(json);
}

// @freezed
// class DisplayNameModel with _$DisplayNameModel {
//   const factory DisplayNameModel({
//     required int? id,
//     @JsonKey(name: 'display_name') required String? displayName,
//   }) = _DisplayNameModel;

//   factory DisplayNameModel.fromJson(dynamic json) {
//     if (json is bool) {
//       return const DisplayNameModel(id: null, displayName: null);
//     } else {
//       return _$DisplayNameModelFromJson(json as Map<String, dynamic>);
//     }
//   }
// }
