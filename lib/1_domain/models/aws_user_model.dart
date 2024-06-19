// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first
// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'aws_user_model.freezed.dart';
part 'aws_user_model.g.dart';

@freezed
class AwsUser with _$AwsUser {
  const factory AwsUser({
    required num accessLevel,
    required num commissionSplit,
    required String displayName,
    required String email,
    required num? salesManagerId,
  }) = _AwsUser;

  factory AwsUser.fromJson(Map<String, dynamic> json) =>
      _$AwsUserFromJson(json);

  factory AwsUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return AwsUser(
      accessLevel: doc.get('access_level') as num,
      commissionSplit: doc.get('commission__split') as num,
      displayName: doc.get('name') as String,
      email: doc.get('email') as String,
      salesManagerId: doc.get('sales_manager_id') as num,
    );
  }
}
