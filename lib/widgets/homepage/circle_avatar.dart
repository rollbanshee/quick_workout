// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
    required this.width,
    required this.height,
    required this.image,
  });
  final Uint8List? image;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: image == null
              ? null
              : DecorationImage(
                  image: Image.memory(image!).image, fit: BoxFit.cover),
          color: AppColors.whiteLight,
          shape: BoxShape.circle),
      child: image == null
          ? SvgPicture.asset(
              AppSvgs.camera,
              width: 32.w,
              fit: BoxFit.scaleDown,
              color: Colors.white,
            )
          : null,
    );
  }
}
