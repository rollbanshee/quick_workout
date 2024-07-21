import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final dynamic provider;
  final int maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;

  final VoidCallback? onChanged;

  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.maxLines,
      this.onChanged,
      this.provider,
      this.maxLength,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      onChanged: (value) {
        onChanged!();
      },
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: Colors.white,
      maxLines: maxLines,
      style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
          fontFamily: AppFonts.sfPro,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: AppColors.textNotActive,
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              fontFamily: AppFonts.sfPro),
          fillColor: AppColors.whiteLight,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.separator)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.separator))),
    );
  }
}
