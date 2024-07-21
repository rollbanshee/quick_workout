// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/models/strategies/strategies_item.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/strategies_provider.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/ui/homepage_r/strategies/edit_strategies.dart';
import 'package:quick_workout/ui/homepage_r/strategies/strategies_widgets/row_delete_edit_strategies.dart';
import 'package:quick_workout/widgets/homepage/app_mbsheet.dart';
import 'package:quick_workout/widgets/homepage/delete_cancel_mbsheet.dart';
import 'package:quick_workout/widgets/text_widgets/text_main13.dart';
import 'package:quick_workout/widgets/text_widgets/text_main22.dart';
import 'package:quick_workout/widgets/text_widgets/text_second15.dart';

class StrategiesCard extends StatelessWidget {
  final ScrollController scrollController;
  final int index;
  const StrategiesCard({
    super.key,
    required this.index,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final providerStrategies = context.watch<StrategiesProvider>();
    final List<StrategiesItem> items =
        providerStrategies.box.values.cast<StrategiesItem>().toList();
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.antiAlias,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.w),
              ),
            ),
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(11, 32, 53, 0.2),
                    Color.fromRGBO(11, 32, 53, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.4]),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppImages.strategiesBig,
                height: 300.h,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RowDeleteEditStrategies(
                  onPressEdit: () {
                    providerStrategies.editStrategies(index);
                    showAppModalBottomSheet(
                        context, EditStrategies(index: index));
                  },
                  onPressDelete: () async {
                    bool? pop = await showDeleteConfirmation(context, () {
                      providerStrategies.deleteItem(index);
                    }, 'Your Strategy');
                    pop == true ? Navigator.pop(context) : null;
                  },
                ),
                SizedBox(
                  height: 144.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.w),
                      color: AppColors.primary),
                  child: TextMain13Widget(
                    maxLines: 1,
                    text: items.isEmpty
                        ? 'Abbreviation'
                        : items[index].abbreviation,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.h, bottom: 20.h),
                  child: TextMain22Widget(
                    textMain: items.isEmpty ? 'Title' : items[index].title,
                    maxLines: 2,
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        controller: scrollController,
                        child: TextSecond15Widget(
                            text: items.isEmpty ? 'Text' : items[index].text))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
