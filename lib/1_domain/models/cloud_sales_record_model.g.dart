// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_sales_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CloudSalesOrderImpl _$$CloudSalesOrderImplFromJson(
        Map<String, dynamic> json) =>
    _$CloudSalesOrderImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      createDate: json['create_date'] == null
          ? null
          : DateTime.parse(json['create_date'] as String),
      partnerIdDisplayName: json['partner_id_display_name'] as String?,
      partnerIdContactAddress: json['partner_id_contact_address'] as String?,
      partnerIdPhone: json['partner_id_phone'],
      xStudioSalesRep1: json['x_studio_sales_rep_1'] as String?,
      xStudioSalesSource: json['x_studio_sales_source'] as String?,
      xStudioCommissionPaid: json['x_studio_commission_paid'] as bool,
      xStudioReferrerProcessed: json['x_studio_referrer_processed'] as bool,
      xStudioPaymentType: json['x_studio_payment_type'] as String?,
      amountTotal: (json['amount_total'] as num?)?.toDouble(),
      deliveryStatus: json['delivery_status'],
      amountToInvoice: (json['amount_to_invoice'] as num?)?.toDouble(),
      xStudioInvoicePaymentStatus: json['x_studio_invoice_payment_status'],
      internalNoteDisplay: json['internal_note_display'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$CloudSalesOrderImplToJson(
        _$CloudSalesOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'create_date': instance.createDate?.toIso8601String(),
      'partner_id_display_name': instance.partnerIdDisplayName,
      'partner_id_contact_address': instance.partnerIdContactAddress,
      'partner_id_phone': instance.partnerIdPhone,
      'x_studio_sales_rep_1': instance.xStudioSalesRep1,
      'x_studio_sales_source': instance.xStudioSalesSource,
      'x_studio_commission_paid': instance.xStudioCommissionPaid,
      'x_studio_referrer_processed': instance.xStudioReferrerProcessed,
      'x_studio_payment_type': instance.xStudioPaymentType,
      'amount_total': instance.amountTotal,
      'delivery_status': instance.deliveryStatus,
      'amount_to_invoice': instance.amountToInvoice,
      'x_studio_invoice_payment_status': instance.xStudioInvoicePaymentStatus,
      'internal_note_display': instance.internalNoteDisplay,
      'state': instance.state,
    };
