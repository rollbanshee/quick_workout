import 'dart:io';
import 'package:battery_plus/battery_plus.dart';
import 'package:carrier_info/carrier_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:intl/intl.dart';
import 'package:locale_plus/locale_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';

import 'package:system_info2/system_info2.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GetUserData {
  static final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  static final Connectivity connectivity = Connectivity();
  static final Battery battery = Battery();
  static bool? checkToken;

  static Future<Map<String, dynamic>> getUserData() async {
    IosDeviceInfo? iosInfo =
        Platform.isAndroid ? null : await deviceInfo.iosInfo;
    List<ConnectivityResult> connectivityResult =
        await connectivity.checkConnectivity();
    BatteryState batteryState = await battery.batteryState;
    int batteryLevel = await battery.batteryLevel;
    bool isCharging = batteryState == BatteryState.charging;
    bool isFullyCharged = batteryLevel == 100;
    bool isVPNActive = connectivityResult.contains(ConnectivityResult.vpn);
    final wifiIP = await NetworkInfo().getWifiIP();
    final usesMetricSystem = await LocalePlus().usesMetricSystem();
    final regionCode = await LocalePlus().getRegionCode();
    Map<String, dynamic> userData = {
      'vivisWork': isVPNActive, // Состояние VPN
      'gfdokPS': iosInfo?.name, // Имя девайса
      'gdpsjPjg': iosInfo?.model, // Имя модели
      'poguaKFP': iosInfo?.identifierForVendor, //Уник. номер
      'gpaMFOfa': wifiIP, // Wi-Fi адрес
      'gciOFm': await checkSimCard(), // Сим-карта
      'bcpJFs': iosInfo?.systemVersion, // Версия iOS
      'GOmblx': Platform.localeName, // Язык девайса
      'G0pxum': getFormattedDateTime(), // Тайм-зона
      'Fpvbduwm': isCharging, // Заряжается ли
      'Fpbjcv': SysInfo.getTotalPhysicalMemory().toString(), // Обьем памяти
      'StwPp': false, // Скриншот ли
      'KDhsd': false, // Скринкаст ли
      'bvoikOGjs': await checkInstalledApps(), // Наличие прил
      'gfpbvjsoM': batteryLevel, // Уровень заряда
      'gfdosnb': null, // Клавиатуры
      'bpPjfns': regionCode, // Регион
      'biMpaiuf': usesMetricSystem, // Метрическая ли
      'oahgoMAOI': isFullyCharged // Полная ли зарядка
    };
    return userData;
  }

  static Future<Map<String, String>> checkInstalledApps() async {
    final Map<String, String> appErrors = {};

    final apps = {
      'WhatsApp': 'whatsapp://',
      'Telegram': 'tg://',
      'Instagram': 'instagram://',
      'Facebook': 'fb://',
      'YouTube': 'youtube://',
    };

    final errors = {
      'WhatsApp': 'er1',
      'Telegram': 'er2',
      'Instagram': 'er3',
      'Facebook': 'er4',
      'YouTube': 'er5',
    };

    for (var app in apps.entries) {
      final isInstalled = await canLaunchUrlString(app.value);
      if (isInstalled) {
        appErrors[app.key] = errors[app.key]!;
      }
    }
    return appErrors;
  }

  static Future<String> checkSimCard() async {
    try {
      if (Platform.isIOS) {
        IosCarrierData? carrierInfoIos = await CarrierInfo.getIosInfo();
        return carrierInfoIos.carrierData[0].carrierName;
      } else if (Platform.isAndroid) {
        AndroidCarrierData? carrierInfoAndroid =
            await CarrierInfo.getAndroidInfo();
        return carrierInfoAndroid?.subscriptionsInfo[0].displayName ??
            'Unknown';
      }
      return 'Unknown';
    } catch (e) {
      return 'Unknown';
    }
  }

  static String getFormattedDateTime() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('MM/dd/yyyy h:mm:ss a');
    String formattedDateTime = formatter.format(now);
    return formattedDateTime;
  }
}
