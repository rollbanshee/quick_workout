import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/ui/onboarding/onboarding_r/onboarding_r.dart';

class SplashScreenR extends StatefulWidget {
  const SplashScreenR({super.key});

  @override
  State<SplashScreenR> createState() => _SplashScreenRState();
}

class _SplashScreenRState extends State<SplashScreenR> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000)).then((value) =>
        Navigator.pushReplacement(context, _createRoute(const OnboardingR())));

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
      backgroundColor: const Color.fromRGBO(7, 17, 26, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 210.h,
            ),
            SvgPicture.asset(
              AppSvgs.logoQw,
              width: 188.w,
              height: 188.w,
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
