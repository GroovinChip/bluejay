import 'package:flutter/material.dart';

/// A useful class for reusing AnimationController boilerplate.
///
/// This code was authored by Andrea Bizzotto. Please view the original source
/// [here](https://twitter.com/biz84/status/1392157691531956224?s=20).
abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  AnimationControllerState(this.animationDuration);

  final Duration animationDuration;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
