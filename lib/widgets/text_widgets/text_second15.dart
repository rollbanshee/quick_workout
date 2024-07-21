import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';

class TextSecond15Widget extends StatelessWidget {
  const TextSecond15Widget({
    super.key,
    required this.text,
    this.maxLines,
    this.textOverflow,
  });
  final TextOverflow? textOverflow;
  final String text;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
          overflow: textOverflow,
          fontFamily: AppFonts.sfPro,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecond),
    );
  }
}
