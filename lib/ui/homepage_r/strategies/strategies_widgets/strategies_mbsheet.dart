import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/ui/homepage_r/strategies/strategies_card.dart';

Future<dynamic> showStrategiesModalBottomSheet(context, index) {
  return showModalBottomSheet(
      enableDrag: true,
      backgroundColor: AppColors.bgSecond,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          maxChildSize: 0.92,
          minChildSize: 0.5,
          initialChildSize: 0.92,
          builder: (context, scrollController) => StrategiesCard(
            index: index,
            scrollController: scrollController,
          ),
        );
      });
}
