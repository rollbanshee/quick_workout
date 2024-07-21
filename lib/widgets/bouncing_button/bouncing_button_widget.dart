import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';

class BouncingButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPress;
  final bool checkEmpty;

  const BouncingButtonWidget(
      {super.key,
      required this.buttonName,
      required this.onPress,
      this.checkEmpty = false});

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onPress: checkEmpty ? () {} : onPress,
      child: Container(
        foregroundDecoration: checkEmpty
            ? BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.w)),
                backgroundBlendMode: BlendMode.darken,
                color: Colors.black54)
            : null,
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12.w)),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
        ),
        child: Text(
          textAlign: TextAlign.center,
          buttonName,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              fontFamily: AppFonts.sfPro,
              color: Colors.white),
        ),
      ),
    );
  }
}
