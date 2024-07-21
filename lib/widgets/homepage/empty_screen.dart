import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_workout/widgets/text_widgets/text_main22.dart';
import 'package:quick_workout/widgets/text_widgets/text_second13.dart';

class EmptyScreenWidget extends StatelessWidget {
  final String svgAssetName;
  final String screenName;
  const EmptyScreenWidget(
      {super.key, required this.screenName, required this.svgAssetName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150.h,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svgAssetName,
            ),
            SizedBox(
              width: 32.w,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TextMain22Widget(textMain: 'Empty', maxLines: 1),
              SizedBox(
                height: 4.h,
              ),
              TextSecond13Widget(
                  text: 'You don\'t have any $screenName\nadded yet')
            ])
          ],
        ),
      ],
    );
  }
}
