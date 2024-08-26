import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/models/matches/matches_item.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/matches_provider.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/ui/homepage_r/matches/matches_widgets/matches_listview_item.dart';
import 'package:quick_workout/ui/homepage_r/matches/matches_widgets/winning_currency.dart';
import 'package:quick_workout/ui/homepage_r/matches/new_match.dart';
import 'package:quick_workout/widgets/homepage/app_mbsheet.dart';
import 'package:quick_workout/widgets/homepage/appbar.dart';
import 'package:quick_workout/widgets/homepage/empty_screen.dart';

class Matches extends StatelessWidget {
  const Matches({super.key});

  @override
  Widget build(BuildContext context) {
    final providerMatches = context.watch<MatchesProvider>();
    final List<MatchesItem> items =
        providerMatches.box.values.cast<MatchesItem>().toList();
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
        child: Column(
          children: [
            AppBarWIdget(
                provider: providerMatches,
                title: context.t.matches.appbar,
                onPress: () {
                  showAppModalBottomSheet(context, const NewMatch());
                }),
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: const WinningCurrency(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const Divider(
                height: 0,
                color: AppColors.separator,
              ),
            ),
            items.isEmpty
                ? EmptyScreenWidget(
                    text: context.t.matches.empty_screen[1],
                    svgAssetName: AppSvgs.matchesEmpty)
                : Flexible(
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) =>
                            MatchesListViewItemWidget(
                              index: index,
                              providerMatches: providerMatches,
                              items: items,
                            )))
          ],
        ),
      )),
    );
  }
}
