// import 'package:firebase_remote_config/firebase_remote_config.dart';

// class FBRemoteConfig {
//   FBRemoteConfig._() : _remoteConfig = FirebaseRemoteConfig.instance;
//   static FBRemoteConfig? _instance;
//   factory FBRemoteConfig() => _instance ??= FBRemoteConfig._();
//   final FirebaseRemoteConfig _remoteConfig;

//   String url = 'https://google.ru';
//   bool isBlock = false;
//   bool isResetLink = false;
//   String date = '20.06.2024';
//   String oneZeroLink = 'https://innovatesphereoracle.fun/app/qu1ckw0rk0ut';
//   String token = 'can_authorize';
//   Future<void> initFBRemoteConfig() async {
//     await _remoteConfig.setConfigSettings(
//       RemoteConfigSettings(
//         fetchTimeout: const Duration(minutes: 1),
//         minimumFetchInterval: const Duration(hours: 12),
//       ),
//     );
//     await _remoteConfig.fetchAndActivate();
//     url = _remoteConfig.getString('url');
//     isBlock = _remoteConfig.getBool('isBlock');
//     isResetLink = _remoteConfig.getBool('isResetLink');
//     date = _remoteConfig.getString('date');
//     oneZeroLink = _remoteConfig.getString('oneZeroLink');
//     token = _remoteConfig.getString('token');
//   }
// }
