import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';

Future<dynamic> showTimePickerModalBottomSheet(context, Widget widget) {
  return showModalBottomSheet(
      enableDrag: true,
      backgroundColor: AppColors.bgSecond,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
      ),
      context: context,
      builder: (context) {
        return SafeArea(
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
                widget,
              ],
            ),
          ),
        );
      });
}
