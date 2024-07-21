import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';

class TextSecond17Widget extends StatelessWidget {
  const TextSecond17Widget({super.key, required this.text, this.maxLines});
  final String text;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: AppFonts.sfPro,
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecond),
    );
  }
}
