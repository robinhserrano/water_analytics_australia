// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cloud_sales_record_model.freezed.dart';
part 'cloud_sales_record_model.g.dart';

@freezed
class CloudSalesOrder with _$CloudSalesOrder {
  const factory CloudSalesOrder({
    required int? id,
    required String? name, //A
    @JsonKey(name: 'create_date') required DateTime? createDate, //B
    @JsonKey(name: 'partner_id_display_name')
    required String? partnerIdDisplayName, //C
    @JsonKey(name: 'partner_id_contact_address')
    required String? partnerIdContactAddress, //D
    @JsonKey(name: 'partner_id_phone') required String? partnerIdPhone, //E
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
  }) = _CloudSalesOrder;

  factory CloudSalesOrder.fromJson(Map<String, dynamic> json) =>
      _$CloudSalesOrderFromJson(json);

  factory CloudSalesOrder.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return CloudSalesOrder(
      id: doc.id as int?, // Assuming ID is an integer (cast)
      name: doc.get('name') as String,
      createDate: doc.get('create_date') as DateTime,
      partnerIdDisplayName: doc.get('x_studio_sales_rep_1') as String,
      partnerIdContactAddress: doc.get('partner_id_contact_address') as String,
      partnerIdPhone: doc.get('partner_id_phone') as String,
      xStudioSalesRep1: doc.get('x_studio_sales_rep_1') as String,
      xStudioSalesSource: doc.get('x_studio_sales_source') as String,
      xStudioCommissionPaid: doc.get('x_studio_commission_paid') as bool,
      xStudioReferrerProcessed: doc.get('x_studio_referrer_processed') as bool,
      xStudioPaymentType: doc.get('x_studio_payment_type') as String,
      amountTotal: doc.get('amount_total') as double,
      deliveryStatus: doc.get('delivery_status') as bool,
      amountToInvoice: doc.get('amount_to_invoice') as double,
      xStudioInvoicePaymentStatus: doc.get('amount_total') as double,
      internalNoteDisplay: doc.get('amount_total') as String,
    );
  }
}
