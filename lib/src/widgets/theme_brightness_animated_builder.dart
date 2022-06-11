import 'package:flutter/material.dart';

/// A simple way to animate between light/dark themes with the animation tied
/// to MaterialApp's [ThemeData].
///
/// Tweens a double when the app changes from light theme to dark theme and
/// lerps colors inline
///
/// Useful when an app is not using Material terminology/semantics for things
/// like colors and typography.
///
/// Sample usage:
/// ```dart
/// class MyLightAndDarkThemeWidget extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return ThemeBrightnessAnimatedBuilder(
///       builder: (context, t, child) {
///         final lightThemeColor = Colors.red.shade800;
///         final darkThemeColor = Colors.red.shade200;
///
///         return Container(
///           /// Light theme color goes on the right, dark theme on the left.
///           color: Color.lerp(lightThemeColor, darkThemeColor, t),
///         );
///       },
///     );
///   }
/// }
///
/// ```
/// This widget was created by Luke Pighetti and edited by GroovinChip.
/// Please view the original source [here](https://gist.github.com/lukepighetti/074f505903e7ab5561da7e8e7fda04b2)
class ThemeBrightnessAnimatedBuilder extends StatelessWidget {
  /// A builder that automatically transitions t between `0.0` and `1.0`
  /// depending on if [ThemeData.brightness] is [Brightness.dark] or
  /// [Brightness.light]
  const ThemeBrightnessAnimatedBuilder({
    super.key,
    required this.builder,
    this.child,
  });

  /// `0.0` when [ThemeData.brightness] is [Brightness.light]
  /// `1.0` when [ThemeData.brightness] is [Brightness.dark]
  final Widget Function(BuildContext, double, Widget?) builder;

  /// A child to pass through without rebuilding when animating.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TweenAnimationBuilder(
      tween: Tween<double>(end: theme.brightness == Brightness.light ? 0 : 1),
      curve: Curves.linear,
      duration: kThemeAnimationDuration,
      builder: builder,
      child: child,
    );
  }
}
