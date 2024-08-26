import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/models/matches/matches_item.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/matches_provider.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:quick_workout/widgets/homepage/delete_cancel_mbsheet.dart';
import 'package:quick_workout/widgets/text_widgets/text_main16.dart';
import 'package:quick_workout/widgets/text_widgets/text_main20.dart';
import 'package:quick_workout/widgets/text_widgets/text_second16.dart';

class MatchesListViewItemWidget extends StatelessWidget {
  const MatchesListViewItemWidget({
    super.key,
    required this.providerMatches,
    required this.index,
    required this.items,
  });

  final MatchesProvider providerMatches;
  final int index;
  final List<MatchesItem> items;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: BouncingButton(
        onPress: () {
          showDeleteConfirmation(context, () {
            providerMatches.deleteItem(index);
          }, context.t.matches.delete[1]);
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.bgSecond,
              borderRadius: BorderRadius.circular(12.w)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child: TextMain16Widget(
                          text: items[index].gameScore, maxLines: 1)),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: TextSecond16Widget(text: items[index].date)))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: const Divider(
                  height: 0,
                  color: AppColors.separator,
                ),
              ),
              TextMain20Widget(
                  textMain: '+\$${items[index].winningAmount}', maxLines: 1)
            ],
          ),
        ),
      ),
    );
  }
}
