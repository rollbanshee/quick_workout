import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_workout/features/constants/app_colors.dart';
import 'package:quick_workout/features/providers/webview_provider.dart';
import 'package:quick_workout/features/resources/resources.dart';
import 'package:quick_workout/widgets/bouncing_button/bouncing_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String titleAppBar;
  final bool existCloseButton;
  const WebViewScreen(
      {super.key, required this.titleAppBar, required this.existCloseButton});

  @override
  Widget build(BuildContext context) {
    final providerWebView = context.watch<WebViewProvider>();
    final controller = providerWebView.controllerWebView;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgSecond,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: existCloseButton
            ? BouncingButton(
                onPress: () => Navigator.pop(context),
                child: const Icon(
                  CupertinoIcons.xmark,
                  color: Colors.white,
                  size: 24,
                ),
              )
            : null,
        actions: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: BouncingButton(
                  onPress: () async {
                    await controller.canGoBack() ? controller.goBack() : null;
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: BouncingButton(
                  onPress: () async {
                    await controller.canGoForward()
                        ? controller.goForward()
                        : null;
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 16.w),
                child: BouncingButton(
                  onPress: () {
                    controller.reload();
                  },
                  child: const Icon(
                    CupertinoIcons.refresh,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
        // toolbarHeight: 60.h,
        leadingWidth: 70.w,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200),
          child: Text(
            titleAppBar,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontFamily: AppFonts.sfPro,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: controller),
            providerWebView.loadingPercentage < 100
                ? LinearProgressIndicator(
                    color: AppColors.primary,
                    value: providerWebView.loadingPercentage / 100.0,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
