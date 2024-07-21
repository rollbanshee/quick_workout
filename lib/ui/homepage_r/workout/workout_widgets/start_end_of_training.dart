import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/widgets/text_widgets/text_main22.dart';
import 'package:quick_workout/widgets/text_widgets/text_second13.dart';

class StartEndOfTrainingWidget extends StatelessWidget {
  const StartEndOfTrainingWidget({
    super.key,
    required this.text,
    required this.time,
  });
  final String text;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w), color: AppColors.bgSecond),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSecond13Widget(
            text: text,
          ),
          SizedBox(height: 4.h),
  TextMain22Widget(
            maxLines: null,
            textMain: time,
          )
        ],
      ),
    );
  }
}
