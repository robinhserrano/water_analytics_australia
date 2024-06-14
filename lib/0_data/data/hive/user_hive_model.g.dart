// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveAdapter extends TypeAdapter<UserHive> {
  @override
  final int typeId = 0;

  @override
  UserHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHive(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as int,
      fields[8] as int,
      fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserHive obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.dbName)
      ..writeByte(1)
      ..write(obj.userLogin)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.displayName)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.photoUrl)
      ..writeByte(7)
      ..write(obj.accessLevel)
      ..writeByte(8)
      ..write(obj.commissionStatus)
      ..writeByte(9)
      ..write(obj.accessToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
