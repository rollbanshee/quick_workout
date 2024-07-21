import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/widgets/text_widgets/text_second15.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button_widget.dart';
import 'package:quick_workout/widgets/onboarding/button_close_notification.dart';
import 'package:quick_workout/widgets/text_widgets/text_main28.dart';

class NotificationU extends StatelessWidget {
  const NotificationU({super.key});

  @override
  Widget build(BuildContext context) {
    // final notificationProvider = context.read<NotificationsProvider>();
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              AppImages.notification,
              fit: BoxFit.contain,
            ),
            ButtonCloseNotificationWidget(onPress: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const WebViewScreen()));
            }),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 284.h,
                    padding: EdgeInsets.fromLTRB(24.w, 45.h, 24.w, 16.h),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: AppColors.bgSecond,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12))),
                    child: SafeArea(
                        top: false,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          const TextMain28Widget(
                              mainText: 'Don’t miss anything'),
                          SizedBox(
                            height: 6.h,
                          ),
                          const TextSecond15Widget(
                            text: 'Don’t miss the most userful information',
                          ),
                          const Spacer(),
                          BouncingButtonWidget(
                              buttonName: 'Enable notification',
                              onPress: () {
                                // notificationProvider.requestPermission();
                              })
                        ]))))
          ],
        ),
      ),
    );
  }
}
