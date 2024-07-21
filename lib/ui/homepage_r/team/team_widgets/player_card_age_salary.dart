import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/widgets/text_widgets/text_second15.dart';

class PlayerCardAgeSalaryWidget extends StatelessWidget {
  final String title;
  final String text;

  const PlayerCardAgeSalaryWidget({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.whiteLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSecond15Widget(text: title),
          SizedBox(
            height: 4.h,
          ),
          Text(
            text,
            maxLines: 1,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                fontFamily: AppFonts.sfPro,
                color: AppColors.textMain),
          )
        ],
      ),
    );
  }
}
