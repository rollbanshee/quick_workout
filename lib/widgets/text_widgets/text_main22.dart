import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';

class TextMain22Widget extends StatelessWidget {
  final String textMain;
  final int? maxLines;
  const TextMain22Widget({
    super.key,
    required this.textMain,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textMain,
      maxLines: maxLines,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontFamily: AppFonts.sfPro,
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          color: textMain == '00:00' ? AppColors.textNotActive : Colors.white),
    );
  }
}
