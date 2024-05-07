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
    // @JsonKey(name: 'x_studio_referred_by')
    // required ReferredByModel? xStudioReferredBy,
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
  }) = _SalesOrder;

  factory SalesOrder.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderFromJson(json);
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
class ReferredByModel with _$ReferredByModel {
  const factory ReferredByModel({
    @JsonKey(name: 'display_name')
    @BoolStringConverter()
    required String? displayName,
  }) = _ReferredByModel;

  factory ReferredByModel.fromJson(Map<String, dynamic> json) =>
      _$ReferredByModelFromJson(json);
}
// @freezed
// class ReferredByModel with _$ReferredByModel {
//   const factory ReferredByModel({
//     required int? id,
//     @JsonKey(name: 'display_name') required String? displayName,
//   }) = _ReferredByModel;

//   factory ReferredByModel.fromJson(dynamic json) {
//     if (json is bool) {
//       return const ReferredByModel(id: null, displayName: null);
//     } else {
//       return _$ReferredByModelFromJson(json as Map<String, dynamic>);
//     }
//   }
// }
