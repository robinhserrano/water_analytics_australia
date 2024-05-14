// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_filter_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SortFilterHiveAdapter extends TypeAdapter<SortFilterHive> {
  @override
  final int typeId = 1;

  @override
  SortFilterHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SortFilterHive(
      (fields[0] as List).cast<String>(),
      (fields[1] as List).cast<String>(),
      (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, SortFilterHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.selectedCommissionStatus)
      ..writeByte(1)
      ..write(obj.selectedInvoicePaymentStatus)
      ..writeByte(2)
      ..write(obj.selectedDeliverStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SortFilterHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
