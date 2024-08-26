import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/models/workout/workout_item.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/workout_provider.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/widgets/text_widgets/text_main22.dart';
import 'package:quick_workout/widgets/text_widgets/text_second13.dart';
import 'package:quick_workout/widgets/text_widgets/text_second15.dart';

class WorkoutCard extends StatelessWidget {
  final int index;
  const WorkoutCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final providerWorkout = context.watch<WorkoutProvider>();
    final List<WorkoutItem> items = providerWorkout.box.values
        .whereType<WorkoutItem>()
        .cast<WorkoutItem>()
        .toList();
    final bool checkIndex = index != items.length;
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 10.h),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.whiteLight,
                  borderRadius: BorderRadius.circular(8.w)),
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
              child: TextSecond13Widget(
                text: (checkIndex ? items[index].minutes : '40') +
                    context.t.workout.time.minutes,
              ),
            ),
          ),
          TextMain22Widget(
            textMain: checkIndex ? items[index].title : 'Title',
            maxLines: 3,
          ),
          SizedBox(
            height: 24.h,
          ),
          TextSecond15Widget(
              text: checkIndex ? items[index].description : 'Description'),
        ],
      ),
    );
  }
}
