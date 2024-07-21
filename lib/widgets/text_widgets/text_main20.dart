import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/resources/resources.dart';

class TextMain20Widget extends StatelessWidget {
  final String textMain;
  final int? maxLines;
  const TextMain20Widget({
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
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white),
    );
  }
}
