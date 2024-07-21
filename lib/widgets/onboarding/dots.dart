import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';

class DotsWidget extends StatelessWidget {
  final dynamic provider;
  

  const DotsWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 2; i++)
          Padding(
            padding: EdgeInsets.only(top: 16.h, left: 4.w, right: 4.w),
            child: Container(
              width: 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                  color: provider.isPage(i)
                      ? AppColors.textMain
                      : AppColors.separator,
                  shape: BoxShape.circle),
            ),
          )
      ],
    );
  }
}
