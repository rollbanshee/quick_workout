// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strategies_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StrategiesItemAdapter extends TypeAdapter<StrategiesItem> {
  @override
  final int typeId = 2;

  @override
  StrategiesItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StrategiesItem(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StrategiesItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.abbreviation)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StrategiesItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
