import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/widgets/text_widgets/text_main22.dart';
import 'package:quick_workout/widgets/text_widgets/text_second13.dart';

class WinningCurrency extends StatelessWidget {
  const WinningCurrency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.bgSecond, borderRadius: BorderRadius.circular(12.w)),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextSecond13Widget(text: 'Winning currency'),
              SizedBox(
                height: 4.h,
              ),
              const TextMain22Widget(textMain: 'EUR/USD', maxLines: 1)
            ],
          ),
          // BouncingButton(
          //   onPress: () {},
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: AppColors.primary,
          //         borderRadius: BorderRadius.circular(8.w)),
          //     padding:
          //         EdgeInsets.symmetric(vertical: 9.h, horizontal: 33.5),
          //     child: const TextMain15Widget(text: 'Edit'),
          //   ),
          // )
        ],
      ),
    );
  }
}
