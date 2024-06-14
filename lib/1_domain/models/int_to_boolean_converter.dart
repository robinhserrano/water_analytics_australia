import 'package:freezed_annotation/freezed_annotation.dart';

class IntToBooleanConverter implements JsonConverter<bool, int?> {
  const IntToBooleanConverter();

  @override
  bool fromJson(int? json) => json == 1;

  @override
  int? toJson(bool object) => object ? 1 : 0;
}

class IntToBooleanConverter2 implements JsonConverter<bool, dynamic> {
  const IntToBooleanConverter2();

  @override
  bool fromJson(dynamic json) {
    if (json is bool?) return json ?? false;
    return (json as int?) == 1;
  }

  @override
  dynamic toJson(bool object) => object;
}
