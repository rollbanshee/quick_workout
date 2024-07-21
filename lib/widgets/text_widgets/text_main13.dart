import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';

class TextMain13Widget extends StatelessWidget {
  const TextMain13Widget({super.key, required this.text, this.maxLines});
  final String text;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontFamily: AppFonts.sfPro,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textMain),
    );
  }
}
