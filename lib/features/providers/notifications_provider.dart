// // ignore_for_file: avoid_print

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:wealthcraft_sage/main_features_imports.dart';

// class NotificationsProvider {
//   final FirebaseMessaging messaging = FirebaseMessaging.instance;

//   Future<AuthorizationStatus> getPermissionStatus() async {
//     final NotificationSettings settings =
//         await messaging.getNotificationSettings();
//     return settings.authorizationStatus;
//   }

//   Future<void> requestPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     print('User granted permission: ${settings.authorizationStatus}');
//   }
// }
