// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutItemAdapter extends TypeAdapter<WorkoutItem> {
  @override
  final int typeId = 1;

  @override
  WorkoutItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutItem(
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.minutes)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
