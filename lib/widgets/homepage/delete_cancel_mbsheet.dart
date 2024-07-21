import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/resources/resources.dart';

Future<dynamic> showDeleteConfirmation(
    BuildContext context, VoidCallback onPress, String text) {
  return showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(
              'Deletion confirmation',
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.sfPro),
            ),
            content: Text(
              '$text will be permanently deleted',
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
                    'Cancel',
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
                    'Delete',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                        fontFamily: AppFonts.sfPro,
                        color: const Color.fromRGBO(234, 68, 68, 1)),
                  )),
            ],
          ));
}
