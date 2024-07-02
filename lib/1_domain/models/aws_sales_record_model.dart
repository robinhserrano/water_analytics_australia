// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/int_to_boolean_converter.dart';
import 'package:water_analytics_australia/core/bool_string_converter.dart';
part 'aws_sales_record_model.freezed.dart';
part 'aws_sales_record_model.g.dart';

@freezed
class AwsSalesOrder with _$AwsSalesOrder {
  const factory AwsSalesOrder({
    required int? id,
    required String? name, //A
    @JsonKey(name: 'create_date') required DateTime? createDate, //B
    @JsonKey(name: 'updated_at') required DateTime? updatedAt, //B
    @JsonKey(name: 'partner_id_display_name')
    required String? partnerIdDisplayName, //C
    @JsonKey(name: 'partner_id_contact_address')
    required String? partnerIdContactAddress, //D
    @JsonKey(name: 'partner_id_phone') required dynamic partnerIdPhone, //E
    @JsonKey(name: 'x_studio_sales_rep_1')
    required String? xStudioSalesRep1, //F
    @JsonKey(name: 'x_studio_sales_source')
    required String? xStudioSalesSource, //G
    @JsonKey(name: 'x_studio_commission_paid')
    @IntToBooleanConverter()
    required bool xStudioCommissionPaid, //H,
    // @JsonKey(name: 'x_studio_referred_by')
    // required ReferredByModel? xStudioReferredBy,

    @JsonKey(name: 'x_studio_referrer_processed')
    @IntToBooleanConverter()
    required bool xStudioReferrerProcessed, //J,
    @JsonKey(name: 'x_studio_payment_type')
    required String? xStudioPaymentType, //K
    @JsonKey(name: 'amount_total') required double? amountTotal, // L
    @JsonKey(name: 'delivery_status') required dynamic deliveryStatus, //M
    @JsonKey(name: 'amount_to_invoice') required double? amountToInvoice, //N
    @JsonKey(name: 'x_studio_invoice_payment_status')
    required dynamic xStudioInvoicePaymentStatus, //O
    @JsonKey(name: 'internal_note_display') //P
    required String? internalNoteDisplay,
    required String? state,
    @JsonKey(name: 'amount_untaxed') required double? amountUntaxed,
    @JsonKey(name: 'order_line') required List<AwsOrderLine>? orderLine,
    @JsonKey(name: 'additional_deduction') required double? additionalDeduction,
    @JsonKey(name: 'confirmed_by_manager')
    @IntToBooleanConverter()
    required bool confirmedByManager,
    required AwsUser? user,
    @JsonKey(name: 'last_deducted_by') required int? lastDeductedBy,
    @JsonKey(name: 'last_confirmed_by') required int? lastConfirmedBy,
  }) = _AwsSalesOrder;

  factory AwsSalesOrder.fromJson(Map<String, dynamic> json) =>
      _$AwsSalesOrderFromJson(json);
}

@freezed
class AwsOrderLine with _$AwsOrderLine {
  const factory AwsOrderLine({
    required int? id,
    required String? product,
    required String? description,
    required num? quantity,
    required num? delivered,
    required num? invoiced,
    @JsonKey(name: 'x_studio_invoice_payment_status') required num? unitPrice,
    required String? taxes,
    required num? disc,
    @JsonKey(name: 'tax_excl') required num? taxExcl,
  }) = _AwsOrderLine;

  factory AwsOrderLine.fromJson(Map<String, dynamic> json) =>
      _$AwsOrderLineFromJson(json);
}
