import 'dart:typed_data';

import 'package:hive_flutter/adapters.dart';

part 'player_info.g.dart';

@HiveType(typeId: 0)
class PlayerInfo {
  @HiveField(1)
  final Uint8List? avatar;
  @HiveField(2)
  final String playerName;
  @HiveField(3)
  final String playerAge;
  @HiveField(4)
  final String playerPosition;
  @HiveField(5)
  final String playerSalary;
  @HiveField(6)
  final String description;
  PlayerInfo(
    this.avatar,
    this.playerName,
    this.playerAge,
    this.playerPosition,
    this.playerSalary,
    this.description,
  );
}
