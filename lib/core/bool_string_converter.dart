import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';

class BoolStringConverter extends JsonConverter<String, dynamic> {
  const BoolStringConverter();

  @override
  String fromJson(dynamic json) {
    if (json is String) return json;
    return '';
  }

  @override
  dynamic toJson(String object) => object;
}

class BoolRefferedByConverter extends JsonConverter<ReferredByModel, dynamic> {
  const BoolRefferedByConverter();

  @override
  ReferredByModel fromJson(dynamic json) {
    if (json is Map<String, dynamic>) return ReferredByModel.fromJson(json);
    return const ReferredByModel(displayName: '');
  }

  @override
  dynamic toJson(ReferredByModel object) => object;
}
