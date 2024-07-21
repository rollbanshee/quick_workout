import 'package:hive_flutter/adapters.dart';

part 'workout_item.g.dart';

@HiveType(typeId: 1)
class WorkoutItem {
  @HiveField(1)
  final String minutes;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;

  WorkoutItem(this.minutes, this.title, this.description);
}
