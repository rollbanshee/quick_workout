// ignore_for_file: avoid_print

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/models/server_response/server_response.dart';
import 'package:quick_workout/features/providers/webview_provider.dart';
import 'package:quick_workout/main_features.dart';
import 'package:quick_workout/ui/splash_screen/splash_screen_r.dart';
import 'package:quick_workout/ui/splash_screen/splash_screen_u.dart';

@pragma('vm:entry-point')
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainFeatures.firebaseInit();
  MainFeatures.systemChrome();
  await MainFeatures.hive();
  await MainFeatures.response();
  // await FBRemoteConfig().initFBRemoteConfig();
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // print('token:$fcmToken');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MultiProvider(
        providers: MainFeatures.buildProviders(),
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
          ),
          title: '1ХВĖT Football',
          debugShowCheckedModeBanner: false,
          home: ServerResponse.serverResponse!.isBlock
              ? const SplashScreenU()
              : WebViewProvider.box.get('checkAuth') == false
                  ? const SplashScreenU()
                  : const SplashScreenR(),
        ),
      ),
    );
  }
}
