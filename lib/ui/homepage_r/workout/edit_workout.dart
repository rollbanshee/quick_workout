import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/workout_provider.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/ui/homepage_r/workout/timepicker/time_picker.dart';
import 'package:quick_workout/ui/homepage_r/workout/timepicker/time_picker_mbsheet.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:quick_workout/widgets/text_widgets/text_main17.dart';
import 'package:quick_workout/widgets/text_widgets/text_second17.dart';
import 'package:quick_workout/widgets/homepage/textfield.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button_widget.dart';

class EditWorkout extends StatelessWidget {
  final int index;
  const EditWorkout({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final providerWorkout = context.watch<WorkoutProvider>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h),
          child: TextMain17Widget(text: context.t.workout.edit[0], maxLines: 1),
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.t.workout.edit[1],
              style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: AppFonts.sfPro,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            BouncingButton(
              onPress: () {
                showTimePickerModalBottomSheet(
                    context,
                    TimePicker(
                        provider: providerWorkout,
                        onPress: providerWorkout.saveEditMinutes));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(6.w)),
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 11.w),
                child: TextSecond17Widget(
                    text: providerWorkout.minutesEdit + context.t.workout.time.minutes,
                    maxLines: 1),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: const Divider(
            height: 0,
            color: AppColors.separator,
          ),
        ),
        TextFieldWidget(
            onChanged: providerWorkout.checkControllerEmpty,
            controller: providerWorkout.controllerTitle,
            hintText: context.t.workout.edit[2],
            maxLines: 1),
        SizedBox(
          height: 16.h,
        ),
        TextFieldWidget(
            onChanged: providerWorkout.checkControllerEmpty,
            controller: providerWorkout.controllerDescription,
            hintText: context.t.workout.edit[3],
            maxLines: 10),
        SizedBox(
          height: 24.h,
        ),
        BouncingButtonWidget(
            checkEmpty: providerWorkout.checkAnyControllerEmpty,
            buttonName: context.t.workout.edit[4],
            onPress: () {
              providerWorkout.saveEditWorkout(index);
              Navigator.pop(context);
            })
      ],
    );
  }
}
