import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/matches_provider.dart';
import 'package:quick_workout/ui/homepage_r/matches/datepicker/date_picker.dart';
import 'package:quick_workout/ui/homepage_r/matches/datepicker/date_picker_mbsheet.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button_widget.dart';
import 'package:quick_workout/widgets/homepage/textfield.dart';
import 'package:quick_workout/widgets/text_widgets/text_main16.dart';
import 'package:quick_workout/widgets/text_widgets/text_main17.dart';
import 'package:quick_workout/widgets/text_widgets/text_second17.dart';

class NewMatch extends StatelessWidget {
  const NewMatch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerMatches = context.watch<MatchesProvider>();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h),
          child: const TextMain17Widget(text: 'New Match', maxLines: 1),
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextMain16Widget(text: 'Match date', maxLines: 1),
            BouncingButton(
              onPress: () {
                showDatePickerModalBottomSheet(
                    context,
                    DatePicker(
                      provider: providerMatches,
                    ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 11.w),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(6.w)),
                child: TextSecond17Widget(
                  text: providerMatches.date,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 24.h,
          ),
          child: const Divider(
            height: 0,
            color: AppColors.separator,
          ),
        ),
        TextFieldWidget(
            onChanged: providerMatches.checkControllerEmpty,
            controller: providerMatches.controllerGameScore,
            hintText: 'Game Score',
            maxLines: 1),
        SizedBox(
          height: 16.h,
        ),
        TextFieldWidget(
            keyboardType: TextInputType.number,
            onChanged: providerMatches.checkControllerEmpty,
            controller: providerMatches.controllerWinningAmount,
            hintText: 'Winning Amount',
            maxLines: 1),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: BouncingButtonWidget(
            buttonName: 'Add',
            checkEmpty: providerMatches.checkAnyControllerEmpty,
            onPress: () {
               providerMatches.addMatches();
              Navigator.pop(context);
              providerMatches.clearTextControllers();
            },
          ),
        )
      ],
    );
  }
}
