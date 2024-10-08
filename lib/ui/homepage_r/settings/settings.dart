import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/settings_provider.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/ui/homepage_r/settings/settings_listview_item.dart';
import 'package:quick_workout/ui/homepage_r/settings/settings_widgets/change_lang_row_widget.dart';
import 'package:quick_workout/widgets/homepage/appbar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final providerSettings = context.watch<SettingsProvider>();
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            AppBarWIdget(
              provider: providerSettings,
              title: context.t.settings.appbar,
              onPress: () {},
              plusCheck: false,
            ),
            SizedBox(
              height: 16.h,
            ),
            Column(children: [
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => SettingsListViewItem(
                      providerSettings: providerSettings, index: index)),
              const ChangeLangRowWidget()
            ])
          ],
        ),
      )),
    );
  }
}

