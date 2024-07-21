import 'package:flutter/cupertino.dart';

class PageViewWidget extends StatelessWidget {
  final dynamic provider;
  final Function(int) onPageChanged;
  final String image1;
  final String image2;

  const PageViewWidget(
      {super.key,
      required this.provider,
      required this.onPageChanged,
      required this.image1,
      required this.image2});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: onPageChanged,
      controller: provider.controllerPage,
      children: [
        Image.asset(
          image1,
          fit: BoxFit.contain,
        ),
        Image.asset(
          image2,
          fit: BoxFit.contain,
        )
      ],
    );
  }
}
