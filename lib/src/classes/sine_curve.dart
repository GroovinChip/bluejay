import 'dart:math';

import 'package:flutter/animation.dart';

/// {@template sineCurve}
/// Defines a sine curve.
///
/// Repeats the sine function [count] times over a 2 * pi period.
///
/// This class was authored by Andrea Bizzotto. Please view the original source
/// [here](https://twitter.com/biz84/status/1392157513211121668?s=20).
/// {@endtemplate}
class SineCurve extends Curve {
  /// {@macro sineCurve}
  const SineCurve({this.count = 3});

  final double count;

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t);
  }
}
