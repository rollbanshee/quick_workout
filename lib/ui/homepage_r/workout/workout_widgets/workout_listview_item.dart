import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/models/workout/workout_item.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/workout_provider.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/ui/homepage_r/workout/edit_workout.dart';
import 'package:quick_workout/ui/homepage_r/workout/workout_card.dart';
import 'package:quick_workout/ui/homepage_r/workout/workout_widgets/workout_mbsheet.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:quick_workout/widgets/homepage/app_mbsheet.dart';
import 'package:quick_workout/widgets/homepage/delete_cancel_mbsheet.dart';
import 'package:quick_workout/widgets/text_widgets/text_main17.dart';
import 'package:quick_workout/widgets/text_widgets/text_second13.dart';

class WorkoutListViewItemWidget extends StatelessWidget {
  const WorkoutListViewItemWidget({
    super.key,
    required this.providerWorkout,
    required this.index,
    required this.items,
  });

  final WorkoutProvider providerWorkout;
  final int index;
  final List<WorkoutItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Slidable(
          endActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              onPressed: (context) {
                providerWorkout.editWorkout(index);
                showAppModalBottomSheet(
                    context,
                    EditWorkout(
                      index: index,
                    ));
              },
              backgroundColor: AppColors.editOrange,
              foregroundColor: Colors.white,
              icon: CupertinoIcons.pen,
              // label: 'Edit',
            ),
            SlidableAction(
              onPressed: (context) {
                showDeleteConfirmation(context, () {
                  providerWorkout.deleteItem(index);
                }, context.t.workout.delete[1]);
              },
              backgroundColor: AppColors.deleteRed,
              foregroundColor: Colors.white,
              icon: CupertinoIcons.delete_solid,
              // label: 'Save',
            ),
          ]),
          child: BouncingButton(
            behavior: HitTestBehavior.opaque,
            onPress: () {
              showWorkoutCardModalBottomSheet(
                  providerWorkout, context, WorkoutCard(index: index), index);
            },
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 16.h, right: 12.w, top: index == 0 ? 12.h : 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextSecond13Widget(
                      text: (items.isNotEmpty ? items[index].minutes : '40') +
                          context.t.workout.time.minutes),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextMain17Widget(
                    text: items.isNotEmpty ? items[index].title : context.t.workout.edit[2],
                    maxLines: 2,
                  )
                ],
              ),
            ),
          ),
        ),
        const Divider(
          height: 0,
          color: AppColors.separator,
        ),
      ],
    );
  }
}
