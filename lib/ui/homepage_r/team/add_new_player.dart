// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/providers/homepage_r_provider/team_provider.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button_widget.dart';
import 'package:quick_workout/widgets/homepage/circle_avatar.dart';
import 'package:quick_workout/widgets/homepage/textfield.dart';

class AddNewPlayer extends StatelessWidget {
  const AddNewPlayer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final providerTeam = context.watch<TeamProvider>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h),
          child: Text(
            'New Player',
            style: TextStyle(
                fontFamily: AppFonts.sfPro,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
          child: BouncingButton(
            behavior: HitTestBehavior.deferToChild,
            onPress: () async {
              await providerTeam.pickImage();
            },
            child: CircleAvatarWidget(
              width: 100.w,
              height: 100.w,
              image: providerTeam.imageUint8List,
            ),
          ),
        ),
        TextFieldWidget(
            controller: providerTeam.controllerPlayerName,
            onChanged: providerTeam.checkControllerEmpty,
            hintText: 'Name Player',
            maxLines: 1),
        SizedBox(
          height: 16.h,
        ),
        TextFieldWidget(
            onChanged: providerTeam.checkControllerEmpty,
            controller: providerTeam.controllerPlayerPosition,
            hintText: 'Player Position',
            maxLines: 1),
        SizedBox(
          height: 16.h,
        ),
        TextFieldWidget(
            keyboardType: TextInputType.number,
            onChanged: providerTeam.checkControllerEmpty,
            controller: providerTeam.controllerAge,
            hintText: 'Age',
            maxLines: 1),
        SizedBox(
          height: 16.h,
        ),
        TextFieldWidget(
            keyboardType: TextInputType.number,
            onChanged: providerTeam.checkControllerEmpty,
            controller: providerTeam.controllerSalary,
            hintText: 'Salary',
            maxLines: 1),
        SizedBox(
          height: 16.h,
        ),
        TextFieldWidget(
            onChanged: providerTeam.checkControllerEmpty,
            controller: providerTeam.controllerDescription,
            hintText: 'Description',
            maxLines: 10),
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 12.h),
          child: BouncingButtonWidget(
              checkEmpty: providerTeam.checkAnyControllerEmpty,
              buttonName: 'Add',
              onPress: () {
                providerTeam.addPlayer();
                Navigator.pop(context);
                providerTeam.clearTextControllers();
              }),
        )
      ],
    );
  }
}
