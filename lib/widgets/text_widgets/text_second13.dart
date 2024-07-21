import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';

class TextSecond13Widget extends StatelessWidget {
  final int? maxLines;
  const TextSecond13Widget({super.key, required this.text, this.maxLines});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
          fontFamily: AppFonts.sfPro,
          fontSize: 13.sp,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecond),
    );
  }
}
