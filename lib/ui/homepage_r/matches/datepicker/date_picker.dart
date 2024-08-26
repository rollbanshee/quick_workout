import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/matches_provider.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button_widget.dart';
import 'package:quick_workout/widgets/text_widgets/text_main17.dart';

class DatePicker extends StatelessWidget {
  final MatchesProvider provider;
  const DatePicker({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h),
          child: TextMain17Widget(
            text: context.t.matches.new_match_mbs[1].date[0],
            maxLines: 1,
          ),
        ),
        SizedBox(
          height: 178.h,
          child: CupertinoTheme(
            data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
              dateTimePickerTextStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(235, 235, 245, 0.6),
                  fontSize: 23.sp,
                  fontFamily: AppFonts.sfPro),
            )),
            child: CupertinoDatePicker(
                minimumYear: 1950,
                maximumYear: DateTime.now().year,
                initialDateTime: provider.dateTime,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (dateTime) => provider.dateTime = dateTime),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: BouncingButtonWidget(
              buttonName: context.t.matches.new_match_mbs[1].date[1],
              onPress: () {
                provider.saveDate();
                Navigator.pop(context);
              }),
        )
      ],
    );
  }
}
