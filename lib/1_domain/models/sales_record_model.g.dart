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
      xStudioSalesRep1:
          const BoolStringConverter().fromJson(json['x_studio_sales_rep_1']),
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
      userId: const BoolRefferedByConverter().fromJson(json['user_id']),
      teamId: const BoolRefferedByConverter().fromJson(json['team_id']),
      orderLine: (json['order_line'] as List<dynamic>?)
          ?.map((e) => OrderLine.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagIds: (json['tag_ids'] as List<dynamic>?)
          ?.map((e) => TagIdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxTotals: json['tax_totals'] == null
          ? null
          : TaxTotalsModel.fromJson(json['tax_totals'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SalesOrderImplToJson(_$SalesOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'create_date': instance.createDate?.toIso8601String(),
      'partner_id': instance.partnerId,
      'x_studio_sales_rep_1': _$JsonConverterToJson<dynamic, String>(
          instance.xStudioSalesRep1, const BoolStringConverter().toJson),
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
      'user_id': _$JsonConverterToJson<dynamic, DisplayNameModel>(
          instance.userId, const BoolRefferedByConverter().toJson),
      'team_id': _$JsonConverterToJson<dynamic, DisplayNameModel>(
          instance.teamId, const BoolRefferedByConverter().toJson),
      'order_line': instance.orderLine,
      'tag_ids': instance.tagIds,
      'tax_totals': instance.taxTotals,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$OrderLineImpl _$$OrderLineImplFromJson(Map<String, dynamic> json) =>
    _$OrderLineImpl(
      productTemplateId: json['product_template_id'] == null
          ? null
          : DisplayNameModel.fromJson(
              json['product_template_id'] as Map<String, dynamic>),
      name: json['name'] as String?,
      productUomQty: (json['product_uom_qty'] as num?)?.toDouble(),
      qtyDelivered: (json['qty_delivered'] as num?)?.toDouble(),
      qtyInvoiced: (json['qty_invoiced'] as num?)?.toDouble(),
      priceUnit: (json['price_unit'] as num?)?.toDouble(),
      taxId: (json['tax_id'] as List<dynamic>?)
          ?.map((e) => DisplayNameModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      discount: (json['discount'] as num?)?.toDouble(),
      priceSubtotal: (json['price_subtotal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OrderLineImplToJson(_$OrderLineImpl instance) =>
    <String, dynamic>{
      'product_template_id': instance.productTemplateId,
      'name': instance.name,
      'product_uom_qty': instance.productUomQty,
      'qty_delivered': instance.qtyDelivered,
      'qty_invoiced': instance.qtyInvoiced,
      'price_unit': instance.priceUnit,
      'tax_id': instance.taxId,
      'discount': instance.discount,
      'price_subtotal': instance.priceSubtotal,
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

_$DisplayNameModelImpl _$$DisplayNameModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DisplayNameModelImpl(
      displayName: json['display_name'] as String?,
    );

Map<String, dynamic> _$$DisplayNameModelImplToJson(
        _$DisplayNameModelImpl instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
    };

_$TagIdModelImpl _$$TagIdModelImplFromJson(Map<String, dynamic> json) =>
    _$TagIdModelImpl(
      displayName: json['display_name'] as String?,
      color: (json['color'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TagIdModelImplToJson(_$TagIdModelImpl instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
      'color': instance.color,
    };

_$TaxTotalsModelImpl _$$TaxTotalsModelImplFromJson(Map<String, dynamic> json) =>
    _$TaxTotalsModelImpl(
      amountUntaxed: (json['amount_untaxed'] as num?)?.toDouble(),
      amountTotal: (json['amount_total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TaxTotalsModelImplToJson(
        _$TaxTotalsModelImpl instance) =>
    <String, dynamic>{
      'amount_untaxed': instance.amountUntaxed,
      'amount_total': instance.amountTotal,
    };
