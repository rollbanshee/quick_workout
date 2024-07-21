import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/widgets/text_widgets/text_second15.dart';

class PlayerCardInfoWidget extends StatelessWidget {
  final String info;

  final int? maxLines;
  const PlayerCardInfoWidget({
    super.key,
    required this.info,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 224.h,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            color: AppColors.whiteLight),
        child: SingleChildScrollView(
          child: TextSecond15Widget(
            text: info,
          ),
        ));
  }
}
