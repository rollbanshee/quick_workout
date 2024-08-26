// ignore_for_file: avoid_print

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/main_features.dart';
import 'package:quick_workout/main_features_imports.dart';
import 'package:quick_workout/ui/splash_screen/splash_screen_r.dart';

@pragma('vm:entry-point')
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  // LocaleSettings.setLocale(AppLocale.en);
  // await MainFeatures.firebaseInit();
  MainFeatures.systemChrome();
  await MainFeatures.hive();
  final box = Hive.box('others');
  LocaleSettings.useDeviceLocale();
  box.get('lang') == null ? null : LocaleSettings.setLocaleRaw(box.get('lang'));
  // await MainFeatures.response();
  // await FBRemoteConfig().initFBRemoteConfig();
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // print('token:$fcmToken');
  runApp(TranslationProvider(child: const MyApp()));
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
          locale: TranslationProvider.of(context).flutterLocale,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          supportedLocales: AppLocaleUtils.supportedLocales,
          theme: ThemeData(
            useMaterial3: true,
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
          ),
          // title: '1ХВĖT Football',
          title: 'Quick Workout',
          debugShowCheckedModeBanner: false,
          home:
              // ServerResponse.serverResponse!.isBlock
              //     ? const SplashScreenU()
              //     : WebViewProvider.box.get('checkAuth') == false
              // ? const SplashScreenU()
              // :
              const SplashScreenR(),
        ),
      ),
    );
  }
}
