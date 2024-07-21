import 'package:hive_flutter/adapters.dart';

part 'matches_item.g.dart';

@HiveType(typeId: 3)
class MatchesItem {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final String gameScore;
  @HiveField(2)
  final String winningAmount;

  MatchesItem(this.date, this.gameScore, this.winningAmount);

}
