// ignore_for_file: avoid_print

import 'package:intl/intl.dart';

import 'main_features_imports.dart';

class MainFeatures {
  static buildProviders() {
    return [
      ChangeNotifierProvider(create: (context) => OnboardingRProvider()),
      ChangeNotifierProvider(create: (context) => OnboardingUProvider()),
      ChangeNotifierProvider(create: (context) => TeamProvider()),
      ChangeNotifierProvider(create: (context) => WorkoutProvider()),
      ChangeNotifierProvider(create: (context) => StrategiesProvider()),
      ChangeNotifierProvider(create: (context) => MatchesProvider()),
      ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ChangeNotifierProvider(create: (context) => WebViewProvider()),
      // Provider(create: (context) => NotificationsProvider()),
    ];
  }

  static hive() async {
    await Hive.initFlutter('hiveBoxes');
    Hive.registerAdapter(PlayerInfoAdapter());
    Hive.registerAdapter(WorkoutItemAdapter());
    Hive.registerAdapter(StrategiesItemAdapter());
    Hive.registerAdapter(MatchesItemAdapter());
    await Hive.openBox("team");
    await Hive.openBox("matches");
    await Hive.openBox("strategies");
    await Hive.openBox("workout");
    await Hive.openBox("others");
  }

  static firebaseInit() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    //   await FirebaseMessaging.instance.setAutoInitEnabled(true);

    //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //     print('Got a message whilst in the foreground!');
    //     print('Message data: ${message.data}');
    //     if (message.notification != null) {
    //       print('Message also contained a notification: ${message.notification}');
    //     }
    //   });
  }

  static systemChrome() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent));
  }

  static response() async {
    await ServerResponse.getResponse();
    DateFormat format = DateFormat("dd.MM.yyyy");
    DateTime date = format.parse(ServerResponse.serverResponse!.date!);
    DateTime now = DateTime.now();
    if (now.isAfter(date)) {
      GetUserData.checkToken =
          await ApiClient.postData(await GetUserData.getUserData());
      if (GetUserData.checkToken == false) {
        WebViewProvider.box.put('checkAuth', GetUserData.checkToken);
      }
      print('AAAAAAAAAAAAAAAAAAAA');
    }
  }
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   print("Handling a background message: ${message.messageId}");
// }
