// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cloud_user_model.freezed.dart';
part 'cloud_user_model.g.dart';

@freezed
class CloudUser with _$CloudUser {
  const factory CloudUser({
    required int accessLevel,
    required String displayName,
    required String email,
    required String? photoUrl,
  }) = _CloudUser;

  factory CloudUser.fromJson(Map<String, dynamic> json) =>
      _$CloudUserFromJson(json);

  factory CloudUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return CloudUser(
      accessLevel: doc.get('accessLevel') as int,
      displayName: doc.get('displayName') as String,
      email: doc.get('email') as String,
      photoUrl: doc.get('photoUrl') as String?,
    );
  }
}
