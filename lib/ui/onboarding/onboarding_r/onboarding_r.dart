import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/providers/onboarding_r_provider.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/ui/homepage_r/bottomnavbar/bottomnavbar.dart';
import 'package:quick_workout/widgets/text_widgets/text_second15.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button_widget.dart';
import 'package:quick_workout/widgets/onboarding/pageview.dart';
import 'package:quick_workout/widgets/onboarding/dots.dart';
import 'package:quick_workout/widgets/text_widgets/text_main28.dart';

class OnboardingR extends StatelessWidget {
  const OnboardingR({super.key});

  @override
  Widget build(BuildContext context) {
    final providerOnboardingR = context.watch<OnboardingRProvider>();
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: Stack(
        children: [
          PageViewWidget(
            image1: AppImages.onboardingR1,
            image2: AppImages.onboardingR2,
            provider: providerOnboardingR,
            onPageChanged: (value) => providerOnboardingR.onPageChanged(value),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 284.h,
              padding: EdgeInsets.fromLTRB(24.w, 28.h, 24.w, 12.h),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: AppColors.bgSecond,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextMain28Widget(mainText: context.t.onboarding[0]),
                    SizedBox(
                      height: 6.h,
                    ),
                    TextSecond15Widget(text: context.t.onboarding[1]),
                    const Spacer(),
                    // SizedBox(
                    //   height: 112.h,
                    // ),
                    BouncingButtonWidget(
                      onPress: () {
                        providerOnboardingR.animateToPage();
                        providerOnboardingR.pageIndex == 1
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomNavBar()))
                            : null;
                      },
                      buttonName: context.t.onboarding[2],
                    ),
                    DotsWidget(provider: providerOnboardingR)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
