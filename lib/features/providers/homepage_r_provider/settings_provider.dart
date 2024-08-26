// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:quick_workout/features/resources/resources.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:quick_workout/i18n/strings.g.dart';
import 'package:quick_workout/main_features_imports.dart';
import 'package:quick_workout/ui/webview/webview.dart';
import 'package:share_plus/share_plus.dart';

class SettingsProvider extends ChangeNotifier {
  final Map<String, dynamic> mapItems = {
    'icons': [AppSvgs.usagePolicy, AppSvgs.shareApp, AppSvgs.rateUs],
    // 'labels': t.settings.items
  };

  final box = Hive.box('others');

  void changeLang(String lang) {
    LocaleSettings.setLocaleRaw(lang);
    box.put('lang', lang);
    notifyListeners();
  }

  final InAppReview inAppReview = InAppReview.instance;

  void callActions(
      int index, BuildContext context, WebViewProvider provider) async {
    switch (index) {
      case 0:
        await provider.setLink(
            "https://www.termsfeed.com/live/6a8a8c36-259b-403c-8b5e-45dcea3c6864");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WebViewScreen(
                      existCloseButton: true,
                      titleAppBar: 'Usage Policy',
                    )));
      case 1:
        final box = context.findRenderObject() as RenderBox?;
        Platform.isAndroid
            ? await Share.share(
                'https://play.google.com/store/apps/details?id=com.khu.qu1ckw0rk0ut')
            : await Share.share(
                'https://apps.apple.com/app/quick-workout/id6504182988',
                sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
              );
      case 2:
        try {
          if (await inAppReview.isAvailable()) {
            inAppReview.requestReview();
          } else {
            inAppReview.openStoreListing(appStoreId: '6504182988');
          }
        } catch (e) {
          print(e);
        }
    }
  }
}
