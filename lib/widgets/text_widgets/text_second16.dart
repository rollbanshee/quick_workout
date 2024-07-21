import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';

class TextSecond16Widget extends StatelessWidget {
  const TextSecond16Widget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: AppFonts.sfPro,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecond),
    );
  }
}
