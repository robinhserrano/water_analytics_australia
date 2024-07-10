// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first
// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:freezed_annotation/freezed_annotation.dart';
part 'aws_user_model.freezed.dart';
part 'aws_user_model.g.dart';

@freezed
class AwsUser with _$AwsUser {
  const factory AwsUser({
    required int id,
    @JsonKey(name: 'access_level') required int accessLevel,
    @JsonKey(name: 'commission_split') required num? commissionSplit,
    @JsonKey(name: 'name') required String displayName,
    required String email,
    @JsonKey(name: 'sales_manager_id') required int? salesManagerId,
    @JsonKey(name: 'self_gen') required double selfGen,
    @JsonKey(name: 'company_lead') required double companyLead,
    @JsonKey(name: 'plain_text') required String? plainText,
  }) = _AwsUser;

  factory AwsUser.fromJson(Map<String, dynamic> json) =>
      _$AwsUserFromJson(json);
}
