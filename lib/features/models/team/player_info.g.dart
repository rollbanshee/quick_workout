// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerInfoAdapter extends TypeAdapter<PlayerInfo> {
  @override
  final int typeId = 0;

  @override
  PlayerInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerInfo(
      fields[1] as Uint8List?,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerInfo obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.avatar)
      ..writeByte(2)
      ..write(obj.playerName)
      ..writeByte(3)
      ..write(obj.playerAge)
      ..writeByte(4)
      ..write(obj.playerPosition)
      ..writeByte(5)
      ..write(obj.playerSalary)
      ..writeByte(6)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
