import 'package:flutter/material.dart';

import '../classes/sine_curve.dart';
import 'animation_controller_state.dart';

/// A widget that can shake.
///
/// Requires a `GlobalKey<ShakeWidgetState>()` to start the animation.
///
/// Usage:
/// ```dart
/// final _shakeKey = GlobalKey<ShakeWidgetState>();
/// ...
///
/// ShakeWidget(
///   key: _shakeKey,
///   shakeCount: 3,
///   shakeOffset: 10,
///   shakeDuration: Duration(milliseconds: 400),
///   child: Text(
///     'Invalid credentials',
///     style: TextStyle(
///       color: Colors.red,
///       fontWeight: FontWeight.bold,
///     ),
///   ),
/// ),
/// ```
///
/// This code was authored by Andrea Bizzotto. Please view the original source
/// [here](https://twitter.com/biz84/status/1392157843164438532?s=20).
class ShakeWidget extends StatefulWidget {
  ShakeWidget({
    Key? key,
    required this.child,
    required this.shakeOffset,
    required this.shakeCount,
    required this.shakeDuration,
  }) : super(key: key);

  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration shakeDuration;

  @override
  ShakeWidgetState createState() => ShakeWidgetState(shakeDuration);
}

class ShakeWidgetState extends AnimationControllerState<ShakeWidget> {
  ShakeWidgetState(Duration duration) : super(duration);
  late Animation<double> _sineAnimation;

  @override
  void initState() {
    super.initState();
    _sineAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
          parent: animationController,
          curve: SineCurve(count: widget.shakeCount.toDouble())),
    );
    animationController.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  /// Starts the shake animation.
  ///
  /// Usage:
  /// ```dart
  /// final _shakeKey = GlobalKey<ShakeWidgetState>(); // use this key with your ShakeWidget
  ///
  /// ...
  ///
  /// _shakeKey.currentState?.shake()
  ///
  /// ```
  void shake() {
    animationController.forward();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sineAnimation,
      child: widget.child,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.translationValues(
              _sineAnimation.value * widget.shakeOffset, 0, 0),
          child: child,
        );
      },
    );
  }
}
