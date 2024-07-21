import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/resources/resources.dart';

class TextMain28Widget extends StatelessWidget {
  final String mainText;
  const TextMain28Widget({super.key, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      mainText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.sfPro,
      ),
    );
  }
}
