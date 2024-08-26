import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/models/strategies/strategies_item.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/strategies_provider.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/ui/homepage_r/strategies/add_new_strategy.dart';
import 'package:quick_workout/ui/homepage_r/strategies/strategies_widgets/strategies_listview_item.dart';
import 'package:quick_workout/widgets/homepage/app_mbsheet.dart';
import 'package:quick_workout/widgets/homepage/appbar.dart';
import 'package:quick_workout/widgets/homepage/empty_screen.dart';

class Strategies extends StatelessWidget {
  const Strategies({super.key});

  @override
  Widget build(BuildContext context) {
    final providerStrategies = context.watch<StrategiesProvider>();
    final List<StrategiesItem> items =
        providerStrategies.box.values.cast<StrategiesItem>().toList();
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
        child: Column(
          children: [
            AppBarWIdget(
                provider: providerStrategies,
                title: context.t.strategies.appbar,
                onPress: () {
                  providerStrategies.clearTextControllers();
                  showAppModalBottomSheet(
                      context,
                      AddNewStrategy(
                        providerStrategies: providerStrategies,
                      ));
                }),
            items.isEmpty
                ? EmptyScreenWidget(
                    text: context.t.strategies.empty_screen[1],
                    svgAssetName: AppSvgs.strategiesEmpty)
                : Flexible(
                    child: Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) =>
                            StrategiesListviewItemWidget(
                              index: index,
                              providerStrategies: providerStrategies,
                              items: items,
                            )),
                  ))
          ],
        ),
      )),
    );
  }
}
