import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/i18n/strings.g.dart';

Future<dynamic> showDeleteConfirmation(
    BuildContext context, VoidCallback onPress, String text) {
  return showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(
              t.team.player_delete_confirmation[0],
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.sfPro),
            ),
            content: Text(
              text,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontFamily: AppFonts.sfPro),
            ),
            actions: [
              CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(
                    t.team.player_delete_confirmation[2],
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: AppFonts.sfPro,
                        color: const Color.fromRGBO(0, 122, 255, 1)),
                  )),
              CupertinoDialogAction(
                  onPressed: () {
                    onPress();
                    Navigator.pop(context, true);
                  },
                  child: Text(
                    context.t.team.player_delete_confirmation[3],
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                        fontFamily: AppFonts.sfPro,
                        color: const Color.fromRGBO(234, 68, 68, 1)),
                  )),
            ],
          ));
}
