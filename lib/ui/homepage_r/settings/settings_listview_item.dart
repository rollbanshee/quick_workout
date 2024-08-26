// ignore_for_file: use_build_context_synchronously

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/main_features_imports.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:quick_workout/widgets/text_widgets/text_main17.dart';

class SettingsListViewItem extends StatelessWidget {
  const SettingsListViewItem({
    super.key,
    required this.providerSettings,
    required this.index,
  });
  final SettingsProvider providerSettings;
  final int index;
  @override
  Widget build(BuildContext context) {
    final providerWebView = context.read<WebViewProvider>();
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: BouncingButton(
        onPress: () {
          providerSettings.callActions(index, context, providerWebView);
        },
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
              color: AppColors.bgSecond,
              borderRadius: BorderRadius.circular(12.w)),
          child: Row(
            children: [
              SizedBox(
                width: 22.h,
                height: 22.h,
                child: SvgPicture.asset(
                  providerSettings.mapItems['icons'][index],
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              TextMain17Widget(text: t.settings.items[index], maxLines: 1),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17.sp,
                color: AppColors.textNotActive,
              )
            ],
          ),
        ),
      ),
    );
  }
}
