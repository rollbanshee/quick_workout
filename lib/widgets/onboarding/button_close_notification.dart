import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';

class ButtonCloseNotificationWidget extends StatelessWidget {
  final VoidCallback onPress;
  const ButtonCloseNotificationWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 16.w,
        top: 12.h,
        child: BouncingButton(
            onPress: onPress,
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.bgButtonX),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.close_rounded,
                    color: AppColors.buttonX,
                    size: 16.sp,
                  ),
                ))));
  }
}
