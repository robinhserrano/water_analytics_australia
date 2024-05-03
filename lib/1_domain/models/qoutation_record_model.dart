// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'qoutation_record_model.freezed.dart';
part 'qoutation_record_model.g.dart';

@freezed
class QuotationRecord with _$QuotationRecord {
  const factory QuotationRecord({
    required int? id,
    required String? name,
    @JsonKey(name: 'partner_id') required IdModel? partnerId,
    @JsonKey(name: 'amount_total') required double? amountTotal,
    @JsonKey(name: 'amount_to_invoice') required double? amountToInvoice,
    @JsonKey(name: 'date_order') required DateTime? dateOrder,
    required String? state,
    @JsonKey(name: 'currency_id') required IdModel? currencyId,
    @JsonKey(name: 'activity_ids') required List<ActivityIdModel>? activityIds,
    @JsonKey(name: 'activity_state') dynamic activityState,
    @JsonKey(name: 'activity_exception_decoration')
    @Default(false)
    bool activityExceptionDecoration,
    @JsonKey(name: 'activity_exception_icon')
    @Default(false)
    bool activityExceptionIcon,
    @JsonKey(name: 'activity_summary') dynamic activitySummary,
    @JsonKey(name: 'activity_type_icon') dynamic activityTypeIcon,
    @JsonKey(name: 'activity_type_id') dynamic activityTypeId,
  }) = _QuotationRecord;

  factory QuotationRecord.fromJson(Map<String, dynamic> json) =>
      _$QuotationRecordFromJson(json);
}

@freezed
class IdModel with _$IdModel {
  const factory IdModel({
    required int? id,
    @JsonKey(name: 'display_name') required String? displayName,
  }) = _IdModel;

  factory IdModel.fromJson(Map<String, dynamic> json) =>
      _$IdModelFromJson(json);
}

@freezed
class ActivityIdModel with _$ActivityIdModel {
  const factory ActivityIdModel({
    required int? id,
  }) = _ActivityIdModel;

  factory ActivityIdModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityIdModelFromJson(json);
}
