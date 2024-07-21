import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';

class AppBarWIdget extends StatelessWidget {
  const AppBarWIdget(
      {super.key,
      required this.provider,
      required this.title,
      required this.onPress,
      this.plusCheck = true});
  final bool plusCheck;
  final VoidCallback onPress;
  final dynamic provider;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80.h,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 34.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.sfPro),
                ),
                plusCheck
                    ? BouncingButton(
                        onPress: onPress,
                        child: Icon(
                          CupertinoIcons.plus_circle_fill,
                          color: Colors.white,
                          size: 32.sp,
                        ))
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ));
  }
}
