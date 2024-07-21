import 'package:flutter/material.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextMain16Widget extends StatelessWidget {
  const TextMain16Widget(
      {super.key, required this.text, required this.maxLines});
  final String text;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: AppFonts.sfPro,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textMain),
    );
  }
}
