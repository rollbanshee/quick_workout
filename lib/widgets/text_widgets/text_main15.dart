import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';

class TextMain15Widget extends StatelessWidget {
  const TextMain15Widget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: AppFonts.sfPro,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textMain),
    );
  }
}
