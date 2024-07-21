import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button_widget.dart';

class EditDeleteRowWidget extends StatelessWidget {
  const EditDeleteRowWidget({
    super.key,
    required this.onPressEdit,
    required this.onPressDelete,
  });
  final VoidCallback onPressEdit;
  final VoidCallback onPressDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: BouncingButtonWidget(
              buttonName: 'Edit',
              onPress: onPressEdit,
            )),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
            flex: 1,
            child: BouncingButton(
              onPress: onPressDelete,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textNotActive),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12.w)),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  vertical: 13.5.h,
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  'Delete',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      fontFamily: AppFonts.sfPro,
                      color: Colors.white),
                ),
              ),
            )),
      ],
    );
  }
}
