import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';

class RowDeleteEditStrategies extends StatelessWidget {
  final VoidCallback onPressEdit;
  final VoidCallback onPressDelete;
  const RowDeleteEditStrategies({
    super.key,
    required this.onPressEdit,
    required this.onPressDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BouncingButton(
          onPress: () => onPressEdit(),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: AppColors.whiteLight),
            padding: const EdgeInsets.all(6),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Icon(
                CupertinoIcons.pen,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        BouncingButton(
          onPress: () => onPressDelete(),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: AppColors.whiteLight),
            padding: const EdgeInsets.all(6),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Icon(
                CupertinoIcons.delete_solid,
                size: 24.sp,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
