import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/ui/homepage_r/matches/matches.dart';
import 'package:quick_workout/ui/homepage_r/settings/settings.dart';
import 'package:quick_workout/ui/homepage_r/strategies/strategies.dart';
import 'package:quick_workout/ui/homepage_r/team/team.dart';
import 'package:quick_workout/ui/homepage_r/workout/workout.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _widgets = const [
    Team(),
    Workout(),
    Strategies(),
    Matches(),
    Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: Center(
        child: _widgets[_currentIndex],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.bgSecond,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.tabbarNotActive,
          selectedItemColor: Colors.white,
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          selectedLabelStyle: const TextStyle(
              fontFamily: AppFonts.sfPro, fontWeight: FontWeight.w500),
          unselectedLabelStyle: const TextStyle(
              fontFamily: AppFonts.sfPro, fontWeight: FontWeight.w500),
          currentIndex: _currentIndex,
          onTap: (value) => setState(() {
            _currentIndex = value;
          }),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: SvgPicture.asset(AppSvgs.team),
              ),
              label: "Team",
              activeIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: SvgPicture.asset(
                  AppSvgs.team,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.5.h),
                child: SvgPicture.asset(AppSvgs.workout),
              ),
              label: "Workout",
              activeIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.5.h),
                child: SvgPicture.asset(
                  AppSvgs.workout,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: SvgPicture.asset(AppSvgs.strategies),
              ),
              label: "Strategies",
              activeIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: SvgPicture.asset(
                  AppSvgs.strategies,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: SvgPicture.asset(AppSvgs.matches),
              ),
              label: "Matches",
              activeIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: SvgPicture.asset(
                  AppSvgs.matches,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: SvgPicture.asset(AppSvgs.settings),
              ),
              label: "Settings",
              activeIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: SvgPicture.asset(
                  AppSvgs.settings,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
