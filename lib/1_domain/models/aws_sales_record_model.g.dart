// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aws_sales_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AwsSalesOrderImpl _$$AwsSalesOrderImplFromJson(Map<String, dynamic> json) =>
    _$AwsSalesOrderImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      createDate: json['create_date'] == null
          ? null
          : DateTime.parse(json['create_date'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      partnerIdDisplayName: json['partner_id_display_name'] as String?,
      partnerIdContactAddress: json['partner_id_contact_address'] as String?,
      partnerIdPhone: json['partner_id_phone'],
      xStudioSalesRep1: json['x_studio_sales_rep_1'] as String?,
      xStudioSalesSource: json['x_studio_sales_source'] as String?,
      xStudioCommissionPaid: const IntToBooleanConverter()
          .fromJson((json['x_studio_commission_paid'] as num?)?.toInt()),
      xStudioReferrerProcessed: const IntToBooleanConverter()
          .fromJson((json['x_studio_referrer_processed'] as num?)?.toInt()),
      xStudioPaymentType: json['x_studio_payment_type'] as String?,
      amountTotal: (json['amount_total'] as num?)?.toDouble(),
      deliveryStatus: json['delivery_status'],
      amountToInvoice: (json['amount_to_invoice'] as num?)?.toDouble(),
      xStudioInvoicePaymentStatus: json['x_studio_invoice_payment_status'],
      internalNoteDisplay: json['internal_note_display'] as String?,
      state: json['state'] as String?,
      amountUntaxed: (json['amount_untaxed'] as num?)?.toDouble(),
      orderLine: (json['order_line'] as List<dynamic>?)
          ?.map((e) => AwsOrderLine.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalDeduction: (json['additional_deduction'] as num?)?.toDouble(),
      confirmedByManager: const IntToBooleanConverter()
          .fromJson((json['confirmed_by_manager'] as num?)?.toInt()),
      user: json['user'] == null
          ? null
          : AwsUser.fromJson(json['user'] as Map<String, dynamic>),
      lastDeductedBy: (json['last_deducted_by'] as num?)?.toInt(),
      lastConfirmedBy: (json['last_confirmed_by'] as num?)?.toInt(),
      manualNotes: json['manual_notes'] as String?,
      dateDeadline: json['date_deadline'] == null
          ? null
          : DateTime.parse(json['date_deadline'] as String),
    );

Map<String, dynamic> _$$AwsSalesOrderImplToJson(_$AwsSalesOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'create_date': instance.createDate?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'partner_id_display_name': instance.partnerIdDisplayName,
      'partner_id_contact_address': instance.partnerIdContactAddress,
      'partner_id_phone': instance.partnerIdPhone,
      'x_studio_sales_rep_1': instance.xStudioSalesRep1,
      'x_studio_sales_source': instance.xStudioSalesSource,
      'x_studio_commission_paid':
          const IntToBooleanConverter().toJson(instance.xStudioCommissionPaid),
      'x_studio_referrer_processed': const IntToBooleanConverter()
          .toJson(instance.xStudioReferrerProcessed),
      'x_studio_payment_type': instance.xStudioPaymentType,
      'amount_total': instance.amountTotal,
      'delivery_status': instance.deliveryStatus,
      'amount_to_invoice': instance.amountToInvoice,
      'x_studio_invoice_payment_status': instance.xStudioInvoicePaymentStatus,
      'internal_note_display': instance.internalNoteDisplay,
      'state': instance.state,
      'amount_untaxed': instance.amountUntaxed,
      'order_line': instance.orderLine,
      'additional_deduction': instance.additionalDeduction,
      'confirmed_by_manager':
          const IntToBooleanConverter().toJson(instance.confirmedByManager),
      'user': instance.user,
      'last_deducted_by': instance.lastDeductedBy,
      'last_confirmed_by': instance.lastConfirmedBy,
      'manual_notes': instance.manualNotes,
      'date_deadline': instance.dateDeadline?.toIso8601String(),
    };

_$AwsOrderLineImpl _$$AwsOrderLineImplFromJson(Map<String, dynamic> json) =>
    _$AwsOrderLineImpl(
      id: (json['id'] as num?)?.toInt(),
      product: json['product'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as num?,
      delivered: json['delivered'] as num?,
      invoiced: json['invoiced'] as num?,
      unitPrice: json['x_studio_invoice_payment_status'] as num?,
      taxes: json['taxes'] as String?,
      disc: json['disc'] as num?,
      taxExcl: json['tax_excl'] as num?,
    );

Map<String, dynamic> _$$AwsOrderLineImplToJson(_$AwsOrderLineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'description': instance.description,
      'quantity': instance.quantity,
      'delivered': instance.delivered,
      'invoiced': instance.invoiced,
      'x_studio_invoice_payment_status': instance.unitPrice,
      'taxes': instance.taxes,
      'disc': instance.disc,
      'tax_excl': instance.taxExcl,
    };
