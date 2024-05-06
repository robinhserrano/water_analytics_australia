// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qoutation_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuotationRecordImpl _$$QuotationRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$QuotationRecordImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      partnerId: json['partner_id'] == null
          ? null
          : IdModel.fromJson(json['partner_id'] as Map<String, dynamic>),
      amountTotal: (json['amount_total'] as num?)?.toDouble(),
      amountToInvoice: (json['amount_to_invoice'] as num?)?.toDouble(),
      dateOrder: json['date_order'] == null
          ? null
          : DateTime.parse(json['date_order'] as String),
      state: json['state'] as String?,
      currencyId: json['currency_id'] == null
          ? null
          : IdModel.fromJson(json['currency_id'] as Map<String, dynamic>),
      activityIds: (json['activity_ids'] as List<dynamic>?)
          ?.map((e) => ActivityIdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      activityState: json['activity_state'],
      activityExceptionDecoration:
          json['activity_exception_decoration'] as bool? ?? false,
      activityExceptionIcon: json['activity_exception_icon'] as bool? ?? false,
      activitySummary: json['activity_summary'],
      activityTypeIcon: json['activity_type_icon'],
      activityTypeId: json['activity_type_id'],
    );

Map<String, dynamic> _$$QuotationRecordImplToJson(
        _$QuotationRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'partner_id': instance.partnerId,
      'amount_total': instance.amountTotal,
      'amount_to_invoice': instance.amountToInvoice,
      'date_order': instance.dateOrder?.toIso8601String(),
      'state': instance.state,
      'currency_id': instance.currencyId,
      'activity_ids': instance.activityIds,
      'activity_state': instance.activityState,
      'activity_exception_decoration': instance.activityExceptionDecoration,
      'activity_exception_icon': instance.activityExceptionIcon,
      'activity_summary': instance.activitySummary,
      'activity_type_icon': instance.activityTypeIcon,
      'activity_type_id': instance.activityTypeId,
    };

_$IdModelImpl _$$IdModelImplFromJson(Map<String, dynamic> json) =>
    _$IdModelImpl(
      id: (json['id'] as num?)?.toInt(),
      displayName: json['display_name'] as String?,
    );

Map<String, dynamic> _$$IdModelImplToJson(_$IdModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
    };

_$ActivityIdModelImpl _$$ActivityIdModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivityIdModelImpl(
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ActivityIdModelImplToJson(
        _$ActivityIdModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
