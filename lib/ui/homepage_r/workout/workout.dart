import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/models/workout/workout_item.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/workout_provider.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/ui/homepage_r/workout/add_new_workout.dart';
import 'package:quick_workout/ui/homepage_r/workout/timepicker/time_picker.dart';
import 'package:quick_workout/ui/homepage_r/workout/timepicker/time_picker_mbsheet.dart';
import 'package:quick_workout/widgets/homepage/empty_screen.dart';
import 'package:quick_workout/ui/homepage_r/workout/workout_widgets/workout_listview_item.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:quick_workout/widgets/homepage/app_mbsheet.dart';
import 'package:quick_workout/widgets/homepage/appbar.dart';
import 'package:quick_workout/ui/homepage_r/workout/workout_widgets/start_end_of_training.dart';

class Workout extends StatelessWidget {
  const Workout({super.key});

  @override
  Widget build(BuildContext context) {
    final providerWorkout = context.watch<WorkoutProvider>();
    final List<WorkoutItem> items = providerWorkout.box.values
        .whereType<WorkoutItem>()
        .cast<WorkoutItem>()
        .toList();
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
        child: Column(
          children: [
            AppBarWIdget(
                provider: providerWorkout,
                title: 'Workout',
                onPress: () {
                  providerWorkout.clearTextControllers();
                  showAppModalBottomSheet(context, const AddNewWorkout());
                }),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: BouncingButton(
                      onPress: () {
                        showTimePickerModalBottomSheet(
                            context,
                            TimePicker(
                              onPress: providerWorkout.saveStartOfTraining,
                              provider: providerWorkout,
                            ));
                      },
                      child: StartEndOfTrainingWidget(
                        text: 'Start of training',
                        time: providerWorkout.box
                            .get('start', defaultValue: '00:00'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    flex: 1,
                    child: BouncingButton(
                      onPress: () {
                        showTimePickerModalBottomSheet(
                            context,
                            TimePicker(
                              onPress: providerWorkout.saveEndOfTraining,
                              provider: providerWorkout,
                            ));
                      },
                      child: StartEndOfTrainingWidget(
                        text: 'End of training',
                        time: providerWorkout.box
                            .get('end', defaultValue: '00:00'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0,
              color: AppColors.separator,
            ),
            items.isEmpty
                ? const EmptyScreenWidget(
                    screenName: 'workouts', svgAssetName: AppSvgs.workoutEmpty)
                : Expanded(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.only(top: 16.h),
                      padding: EdgeInsets.only(
                        left: 16.w,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12.w)),
                          color: AppColors.bgSecond),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) =>
                              WorkoutListViewItemWidget(
                                providerWorkout: providerWorkout,
                                index: index,
                                items: items,
                              )),
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
