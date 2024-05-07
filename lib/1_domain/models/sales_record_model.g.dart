// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrderImpl _$$SalesOrderImplFromJson(Map<String, dynamic> json) =>
    _$SalesOrderImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      createDate: json['create_date'] == null
          ? null
          : DateTime.parse(json['create_date'] as String),
      partnerId: json['partner_id'] == null
          ? null
          : PartnerIdModel.fromJson(json['partner_id'] as Map<String, dynamic>),
      xStudioSalesRep1: json['x_studio_sales_rep_1'] as String,
      xStudioSalesSource: json['x_studio_sales_source'] as String,
      xStudioCommissionPaid: json['x_studio_commission_paid'] as bool,
      xStudioReferredBy: const BoolRefferedByConverter()
          .fromJson(json['x_studio_referred_by']),
      xStudioReferrerProcessed: json['x_studio_referrer_processed'] as bool,
      xStudioPaymentType: json['x_studio_payment_type'] as String,
      amountTotal: (json['amount_total'] as num?)?.toDouble(),
      deliveryStatus: json['delivery_status'],
      amountToInvoice: (json['amount_to_invoice'] as num?)?.toDouble(),
      xStudioInvoicePaymentStatus: json['x_studio_invoice_payment_status'],
      internalNoteDisplay: json['internal_note_display'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$SalesOrderImplToJson(_$SalesOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'create_date': instance.createDate?.toIso8601String(),
      'partner_id': instance.partnerId,
      'x_studio_sales_rep_1': instance.xStudioSalesRep1,
      'x_studio_sales_source': instance.xStudioSalesSource,
      'x_studio_commission_paid': instance.xStudioCommissionPaid,
      'x_studio_referred_by':
          const BoolRefferedByConverter().toJson(instance.xStudioReferredBy),
      'x_studio_referrer_processed': instance.xStudioReferrerProcessed,
      'x_studio_payment_type': instance.xStudioPaymentType,
      'amount_total': instance.amountTotal,
      'delivery_status': instance.deliveryStatus,
      'amount_to_invoice': instance.amountToInvoice,
      'x_studio_invoice_payment_status': instance.xStudioInvoicePaymentStatus,
      'internal_note_display': instance.internalNoteDisplay,
      'state': instance.state,
    };

_$PartnerIdModelImpl _$$PartnerIdModelImplFromJson(Map<String, dynamic> json) =>
    _$PartnerIdModelImpl(
      displayName: json['display_name'] as String?,
      contactAddress: json['contact_address'],
      phone: json['phone'],
    );

Map<String, dynamic> _$$PartnerIdModelImplToJson(
        _$PartnerIdModelImpl instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
      'contact_address': instance.contactAddress,
      'phone': instance.phone,
    };

_$ReferredByModelImpl _$$ReferredByModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferredByModelImpl(
      displayName: json['display_name'] as String?,
    );

Map<String, dynamic> _$$ReferredByModelImplToJson(
        _$ReferredByModelImpl instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
    };
