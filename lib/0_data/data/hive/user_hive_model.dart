// ignore_for_file: avoid_positional_boolean_parameters

import 'package:hive/hive.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 0)
class UserHive {
  UserHive(
    this.dbName,
    this.id,
    this.isSystem,
    this.partnerId,
    this.userId,
    this.userLogin,
    this.userName,
    this.userTz,
    this.password,
  );
  @HiveField(0)
  final String dbName;

  @HiveField(1)
  final String id;

  @HiveField(2)
  final bool isSystem;

  @HiveField(3)
  final int partnerId;

  @HiveField(4)
  final int userId;

  @HiveField(5)
  final String userLogin;

  @HiveField(6)
  final String userName;

  @HiveField(7)
  final String userTz;

  @HiveField(8)
  final String password;
}
