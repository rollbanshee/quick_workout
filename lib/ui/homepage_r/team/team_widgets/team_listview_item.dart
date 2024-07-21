import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:quick_workout/widgets/homepage/circle_avatar.dart';
import 'package:quick_workout/widgets/text_widgets/text_main17.dart';
import 'package:quick_workout/widgets/text_widgets/text_second13.dart';

class TeamListViewItemWidget extends StatelessWidget {
  const TeamListViewItemWidget({
    super.key,
    required this.avatar,
    required this.playerName,
    required this.playerPosition,
    required this.onPress,
  });
  final VoidCallback onPress;
  final Uint8List? avatar;
  final String playerName;
  final String playerPosition;
  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      onPress: onPress,
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.fromLTRB(16, 16, 15, 16),
        decoration: BoxDecoration(
            color: AppColors.bgSecond,
            borderRadius: BorderRadius.circular(12.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatarWidget(width: 48.w, height: 48.w, image: avatar),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextMain17Widget(text: playerName, maxLines: 1),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextSecond13Widget(text: playerPosition)
                ],
              ),
            ),
            SizedBox(
              width: 50.w,
            ),
            // const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17.sp,
              color: AppColors.textNotActive,
            )
          ],
        ),
      ),
    );
  }
}
