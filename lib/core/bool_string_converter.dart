import 'package:freezed_annotation/freezed_annotation.dart';

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
