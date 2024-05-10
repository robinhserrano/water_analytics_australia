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
      fields[0] as String,
      fields[1] as String,
      fields[2] as bool,
      fields[3] as int,
      fields[4] as int,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.dbName)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.isSystem)
      ..writeByte(3)
      ..write(obj.partnerId)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.userLogin)
      ..writeByte(6)
      ..write(obj.userName)
      ..writeByte(7)
      ..write(obj.userTz)
      ..writeByte(8)
      ..write(obj.password);
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
