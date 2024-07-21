// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPress;
  final HitTestBehavior? behavior;
  const BouncingButton(
      {super.key, required this.child, required this.onPress, this.behavior});

  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller!.value;
    return GestureDetector(
      behavior: widget.behavior,
      onTapDown: (TapDownDetails details) => setState(() {
        _controller?.forward();
      }),
      onTapUp: (TapUpDetails details) async {
        await Future.delayed(const Duration(milliseconds: 80));
        _controller?.reverse();
        widget.onPress();
      },
      onTapCancel: () async {
        await Future.delayed(const Duration(milliseconds: 80));
        _controller?.reverse();
      },
      // onPointerDown: (PointerDownEvent event) {
      //   _controller?.forward();
      // },
      // onPointerUp: (PointerUpEvent event) {
      //   _controller?.reverse();
      //   widget.onPress();
      // },
      child: Transform.scale(
        scale: _scale!,
        child: widget.child,
      ),
    );
  }
}
