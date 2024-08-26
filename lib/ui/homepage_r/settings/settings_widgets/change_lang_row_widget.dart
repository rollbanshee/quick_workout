import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/settings_provider.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:quick_workout/widgets/text_widgets/text_main17.dart';

class ChangeLangRowWidget extends StatelessWidget {
  const ChangeLangRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerSettings = context.watch<SettingsProvider>();
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: BouncingButton(
                onPress: () {
                  providerSettings.changeLang('en');
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.textNotActive),
                      color: LocaleSettings.currentLocale == AppLocale.en
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.w)),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: TextMain17Widget(
                      text: 'EN',
                    ),
                  ),
                ))),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
            flex: 1,
            child: BouncingButton(
              onPress: () {
                providerSettings.changeLang('ru');
              },
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.textNotActive),
                      color: LocaleSettings.currentLocale == AppLocale.ru
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.w)),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: TextMain17Widget(
                      text: 'RU',
                    ),
                  )),
            )),
      ],
    );
  }
}
