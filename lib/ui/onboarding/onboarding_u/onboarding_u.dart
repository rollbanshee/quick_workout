// ignore_for_file: use_build_context_synchronously

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/main_features_imports.dart';
import 'package:quick_workout/ui/webview/webview.dart';
import 'package:quick_workout/widgets/text_widgets/text_second15.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button_widget.dart';
import 'package:quick_workout/widgets/onboarding/dots.dart';
import 'package:quick_workout/widgets/onboarding/pageview.dart';
import 'package:quick_workout/widgets/text_widgets/text_main28.dart';

class OnboardingU extends StatelessWidget {
  const OnboardingU({super.key});

  @override
  Widget build(BuildContext context) {
    final providerOnboardingU = context.watch<OnboardingUProvider>();
    final providerWebView = context.read<WebViewProvider>();

    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: Stack(
        children: [
          PageViewWidget(
            image1: AppImages.onboardingU1,
            image2: AppImages.onboardingU2,
            provider: providerOnboardingU,
            onPageChanged: (value) => providerOnboardingU.onPageChanged(value),
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
                    TextMain28Widget(
                      mainText: providerOnboardingU.pageIndex == 0
                          ? 'Raise the stakes to win'
                          : 'Rate our app in the\nAppStore',
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    TextSecond15Widget(
                      text: providerOnboardingU.pageIndex == 0
                          ? 'Bet on the best events'
                          : 'Help make the app even better',
                    ),
                    const Spacer(),
                    BouncingButtonWidget(
                      buttonName: 'Next',
                      onPress: () async {
                        // final AuthorizationStatus auth =
                        //     await providerNotification.getPermissionStatus();
                        providerOnboardingU.animateToPage();
                        providerOnboardingU.pageIndex == 1
                            ?
                            //  auth == AuthorizationStatus.authorized
                            //     ? Navigator.pushReplacement(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: ((context) =>
                            //                 const WebViewScreen())))
                            //     :
                            [
                                SystemChrome.setPreferredOrientations(
                                    DeviceOrientation.values),
                                await providerWebView.setLink(
                                    ServerResponse.serverResponse!.url!),
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const WebViewScreen(
                                              existCloseButton: false,
                                              titleAppBar: 'Search',
                                            ))))
                              ]
                            : null;
                      },
                    ),
                    DotsWidget(provider: providerOnboardingU)
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
