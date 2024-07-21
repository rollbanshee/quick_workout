import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/main_features_imports.dart';
import 'package:quick_workout/ui/onboarding/onboarding_u/onboarding_u.dart';

class SplashScreenU extends StatefulWidget {
  const SplashScreenU({super.key});

  @override
  State<SplashScreenU> createState() => _SplashScreenUState();
}

class _SplashScreenUState extends State<SplashScreenU> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000)).then((value) =>
        Navigator.pushReplacement(context, _createRoute(const OnboardingU())));

    super.initState();
  }

  Route _createRoute(Widget child) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const curve = Curves.easeInOut;
          final curvedAnimation =
              CurvedAnimation(parent: animation, curve: curve);
          return FadeTransition(
            opacity: curvedAnimation,
            child: child,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashU,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 264.h,
            ),
            Image.asset(
              AppImages.logo1w,
              width: 236.w,
              height: 96.w,
            ),
            const Spacer(),
            const CupertinoActivityIndicator(
              color: Colors.white,
            ),
            SizedBox(
              height: 60.h,
            )
          ],
        ),
      ),
    );
  }
}
