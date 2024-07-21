// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MatchesItemAdapter extends TypeAdapter<MatchesItem> {
  @override
  final int typeId = 3;

  @override
  MatchesItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatchesItem(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MatchesItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.gameScore)
      ..writeByte(2)
      ..write(obj.winningAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchesItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
