// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/workout_provider.dart';
import 'package:quick_workout/ui/homepage_r/workout/edit_workout.dart';
import 'package:quick_workout/widgets/homepage/app_mbsheet.dart';
import 'package:quick_workout/widgets/homepage/delete_cancel_mbsheet.dart';
import 'package:quick_workout/widgets/homepage/edit_delete_row.dart';

Future<dynamic> showWorkoutCardModalBottomSheet(
    WorkoutProvider providerWorkout, context, Widget widget, index) {
  return showModalBottomSheet(
      enableDrag: true,
      backgroundColor: AppColors.bgSecond,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          maxChildSize: 0.7,
          minChildSize: 0.4,
          initialChildSize: 0.7,
          builder: (context, scrollController) => SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Container(
                      width: 36.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: AppColors.separator,
                          borderRadius: BorderRadius.circular(64.w)),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          controller: scrollController,
                          child: widget)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: EditDeleteRowWidget(
                      onPressEdit: () {
                        providerWorkout.editWorkout(index);
                        showAppModalBottomSheet(
                            context,
                            EditWorkout(
                              index: index,
                            ));
                      },
                      onPressDelete: () async {
                        bool? pop = await showDeleteConfirmation(context, () {
                          providerWorkout.deleteItem(index);
                        }, 'Your workout');
                        pop == true ? Navigator.pop(context) : null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
