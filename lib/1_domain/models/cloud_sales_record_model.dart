// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cloud_sales_record_model.freezed.dart';
part 'cloud_sales_record_model.g.dart';

@freezed
class CloudSalesOrder with _$CloudSalesOrder {
  const factory CloudSalesOrder({
    required String? id,
    required String? name, //A
    @JsonKey(name: 'create_date') required DateTime? createDate, //B
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
    required bool xStudioCommissionPaid, //H,
    // @JsonKey(name: 'x_studio_referred_by')
    // required ReferredByModel? xStudioReferredBy,
    @JsonKey(name: 'x_studio_referrer_processed')
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
    required List<CloudOrderLines>? orderLines,
    required CloudConfirmedByManager? confirmedByManager,
    required CloudAdditionalDeduction? additionalDeduction,
  }) = _CloudSalesOrder;

  factory CloudSalesOrder.fromJson(Map<String, dynamic> json) =>
      _$CloudSalesOrderFromJson(json);

  factory CloudSalesOrder.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return CloudSalesOrder(
      id: doc.id,
      name: doc.get('name') as String,
      createDate: (doc.get('create_date') as Timestamp).toDate(),
      partnerIdDisplayName: doc.get('partner_id_display_name') as String,
      partnerIdContactAddress: doc.get('partner_id_contact_address') as String,
      partnerIdPhone: doc.get('partner_id_phone') as dynamic,
      xStudioSalesRep1: doc.get('x_studio_sales_rep_1') as String,
      xStudioSalesSource: doc.get('x_studio_sales_source') as String,
      xStudioCommissionPaid: doc.get('x_studio_commission_paid') as bool,
      xStudioReferrerProcessed: doc.get('x_studio_referrer_processed') as bool,
      xStudioPaymentType: doc.get('x_studio_payment_type') as String,
      amountTotal: doc.get('amount_total') as double,
      deliveryStatus: doc.get('delivery_status') as dynamic,
      amountToInvoice: doc.get('amount_to_invoice') as double,
      xStudioInvoicePaymentStatus:
          doc.get('x_studio_invoice_payment_status') as dynamic,
      internalNoteDisplay: doc.get('internal_note_display') as String,
      state: doc.get('state') as String,
      amountUntaxed: doc.get('amount_untaxed') as double,
      orderLines: null,
      confirmedByManager: null,
      additionalDeduction: null,
    );
  }
}

@freezed
class CloudOrderLines with _$CloudOrderLines {
  const factory CloudOrderLines({
    required String? product,
    required String? description,
    required num? quantity,
    required num? delivered,
    required num? invoiced,
    required num? unitPrice,
    required String? taxes,
    required num? disc,
    required num? taxExcl,
  }) = _CloudOrderLines;

  factory CloudOrderLines.fromJson(Map<String, dynamic> json) =>
      _$CloudOrderLinesFromJson(json);

  factory CloudOrderLines.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return CloudOrderLines(
      product: doc.get('product') as String,
      description: doc.get('description') as String,
      quantity: doc.get('quantity') as num,
      delivered: doc.get('delivered') as num,
      invoiced: doc.get('invoiced') as num,
      unitPrice: doc.get('unit_price') as num,
      taxes: doc.get('taxes') as String,
      disc: doc.get('disc') as num,
      taxExcl: doc.get('taxExcl') as num,
    );
  }
}

@freezed
class CloudAdditionalDeduction with _$CloudAdditionalDeduction {
  const factory CloudAdditionalDeduction({
    @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @JsonKey(name: 'last_updated_by') required String? lastUpdatedBy,
    @JsonKey(name: 'additional_deduction') required double? additionalDeduction,
  }) = _CloudAdditionalDeduction;

  factory CloudAdditionalDeduction.fromJson(Map<String, dynamic> json) =>
      _$CloudAdditionalDeductionFromJson(json);

  factory CloudAdditionalDeduction.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return CloudAdditionalDeduction(
      updatedAt: (doc.get('updated_at') as Timestamp).toDate(),
      lastUpdatedBy: doc.get('last_updated_by') as String,
      additionalDeduction: doc.get('additional_deduction') as double,
    );
  }
}

@freezed
class CloudConfirmedByManager with _$CloudConfirmedByManager {
  const factory CloudConfirmedByManager({
    @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @JsonKey(name: 'last_updated_by') required String? lastUpdatedBy,
    @JsonKey(name: 'is_confirmed') required bool? isConfirmed,
  }) = _CloudConfirmedByManager;

  factory CloudConfirmedByManager.fromJson(Map<String, dynamic> json) =>
      _$CloudConfirmedByManagerFromJson(json);

  factory CloudConfirmedByManager.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return CloudConfirmedByManager(
      updatedAt: (doc.get('updated_at') as Timestamp).toDate(),
      lastUpdatedBy: doc.get('last_updated_by') as String,
      isConfirmed: doc.get('is_confirmed') as bool,
    );
  }
}
