import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button_widget.dart';
import 'package:quick_workout/widgets/text_widgets/text_main17.dart';

class TimePicker extends StatelessWidget {
  final VoidCallback onPress;
  final dynamic provider;
  const TimePicker({super.key, required this.provider, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h),
          child: const TextMain17Widget(
            text: 'Training Time',
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
                initialDateTime: provider.dateTime,
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (dateTime) => provider.dateTime = dateTime),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: BouncingButtonWidget(
              buttonName: 'Save',
              onPress: () {
                onPress();
                Navigator.pop(context);
              }),
        )
      ],
    );
  }
}
