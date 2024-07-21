import 'package:hive_flutter/adapters.dart';

part 'strategies_item.g.dart';

@HiveType(typeId: 2)
class StrategiesItem {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String abbreviation;
  @HiveField(2)
  final String text;

  StrategiesItem(this.title, this.abbreviation, this.text);
}
