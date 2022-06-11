import 'package:flutter/material.dart';

/// Some shortcuts on BuildContext I use a lot
extension BuildContextX on BuildContext {
  /// Equivalent to `Theme.of(context)`
  // ignore: recursive_getters
  ThemeData get theme => theme;

  /// Equivalent to `Theme.of(context).colorScheme`
  ColorScheme get colorScheme => theme.colorScheme;

  /// Equivalent to `Theme.of(context).brightness`
  Brightness get brightness => theme.brightness;

  /// True if `Theme.of(context).brightness` is `Brightness.dark`
  bool get isDarkTheme => theme.brightness == Brightness.dark;
}
