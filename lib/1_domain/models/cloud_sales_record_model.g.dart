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
      amountUntaxed: (json['amount_untaxed'] as num?)?.toDouble(),
      orderLines: (json['orderLines'] as List<dynamic>?)
          ?.map((e) => CloudOrderLines.fromJson(e as Map<String, dynamic>))
          .toList(),
      confirmedByManager: json['confirmedByManager'] == null
          ? null
          : CloudConfirmedByManager.fromJson(
              json['confirmedByManager'] as Map<String, dynamic>),
      additionalDeduction: json['additionalDeduction'] == null
          ? null
          : CloudAdditionalDeduction.fromJson(
              json['additionalDeduction'] as Map<String, dynamic>),
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
      'amount_untaxed': instance.amountUntaxed,
      'orderLines': instance.orderLines,
      'confirmedByManager': instance.confirmedByManager,
      'additionalDeduction': instance.additionalDeduction,
    };

_$CloudOrderLinesImpl _$$CloudOrderLinesImplFromJson(
        Map<String, dynamic> json) =>
    _$CloudOrderLinesImpl(
      product: json['product'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as num?,
      delivered: json['delivered'] as num?,
      invoiced: json['invoiced'] as num?,
      unitPrice: json['unitPrice'] as num?,
      taxes: json['taxes'] as String?,
      disc: json['disc'] as num?,
      taxExcl: json['taxExcl'] as num?,
    );

Map<String, dynamic> _$$CloudOrderLinesImplToJson(
        _$CloudOrderLinesImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'description': instance.description,
      'quantity': instance.quantity,
      'delivered': instance.delivered,
      'invoiced': instance.invoiced,
      'unitPrice': instance.unitPrice,
      'taxes': instance.taxes,
      'disc': instance.disc,
      'taxExcl': instance.taxExcl,
    };

_$CloudAdditionalDeductionImpl _$$CloudAdditionalDeductionImplFromJson(
        Map<String, dynamic> json) =>
    _$CloudAdditionalDeductionImpl(
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      lastUpdatedBy: json['last_updated_by'] as String?,
      additionalDeduction: (json['additional_deduction'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CloudAdditionalDeductionImplToJson(
        _$CloudAdditionalDeductionImpl instance) =>
    <String, dynamic>{
      'updated_at': instance.updatedAt?.toIso8601String(),
      'last_updated_by': instance.lastUpdatedBy,
      'additional_deduction': instance.additionalDeduction,
    };

_$CloudConfirmedByManagerImpl _$$CloudConfirmedByManagerImplFromJson(
        Map<String, dynamic> json) =>
    _$CloudConfirmedByManagerImpl(
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      lastUpdatedBy: json['last_updated_by'] as String?,
      isConfirmed: json['is_confirmed'] as bool?,
    );

Map<String, dynamic> _$$CloudConfirmedByManagerImplToJson(
        _$CloudConfirmedByManagerImpl instance) =>
    <String, dynamic>{
      'updated_at': instance.updatedAt?.toIso8601String(),
      'last_updated_by': instance.lastUpdatedBy,
      'is_confirmed': instance.isConfirmed,
    };
