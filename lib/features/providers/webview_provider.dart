import 'package:quick_workout/main_features_imports.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewProvider extends ChangeNotifier {
  final WebViewController controllerWebView = WebViewController();
  int loadingPercentage = 0;
  static final box = Hive.box('others');
  String _lastVisitedUrl = '';
  Future<void> setLink(String linkWebView) async {
    String url = '';
    if (ServerResponse.serverResponse == null
        ? true
        : ServerResponse.serverResponse!.isResetLink) {
      box.put('lastVisitedUrl', linkWebView);
      url = box.get('lastVisitedUrl');
    } else {
      url = box.get('lastVisitedUrl') ?? linkWebView;
    }
    controllerWebView
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          loadingPercentage = 0;
          notifyListeners();
        },
        onProgress: (progress) {
          loadingPercentage = progress;
          notifyListeners();
        },
        onPageFinished: (url) {
          loadingPercentage = 100;
          controllerWebView.currentUrl().then((url) {
            if (url != null && url.isNotEmpty) {
              _lastVisitedUrl = url;
              box.put('lastVisitedUrl', _lastVisitedUrl);
            }
          });
          notifyListeners();
        },
      ))
      ..loadRequest(Uri.parse(url));
  }
}
