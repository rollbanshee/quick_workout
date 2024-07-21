import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/models/strategies/strategies_item.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/strategies_provider.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/ui/homepage_r/strategies/strategies_widgets/strategies_mbsheet.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:quick_workout/widgets/text_widgets/text_main13.dart';
import 'package:quick_workout/widgets/text_widgets/text_main17.dart';

class StrategiesListviewItemWidget extends StatelessWidget {
  final int index;
  final StrategiesProvider providerStrategies;
  final List<StrategiesItem> items;
  const StrategiesListviewItemWidget({
    super.key,
    required this.index,
    required this.providerStrategies,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: BouncingButton(
        onPress: () {
          showStrategiesModalBottomSheet(context, index);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              color: AppColors.bgSecond),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8.w)),
                  child: Image.asset(
                    AppImages.strategiesBig,
                    width: 90.w,
                    fit: BoxFit.cover,
                    height: 90.w,
                  )),
              SizedBox(
                width: 12.w,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
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
                    SizedBox(
                      height: 6.h,
                    ),
                    TextMain17Widget(
                        text: items.isEmpty ? 'Title' : items[index].title,
                        maxLines: 2)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
