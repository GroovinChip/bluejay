// This solution was reached by Marcello Glasburg and shared on Twitter by
// Thomas Burkhart. Please view the source tweet here: https://twitter.com/thomasburkhartb/status/1384162926609666050?s=21

import 'package:flutter/foundation.dart';

/// Ensure that full stacktraces are printed to the console.
///
/// Useful specifically for IntelliJ which tends to cut off logs from external
/// packages
///
/// Usage:
///
/// ```dart
/// import 'package:bluejay/bluejay.dart';
/// import 'package:flutter/material.dart';
///
/// void main() {
///   WidgetsFlutterBinding.ensureInitialized();
///   printFullStacktraces();
///   runApp(
///     MyApp(),
///   );
/// }
/// ```
///
/// This solution was reached by Marcello Glasburg and shared on Twitter by
/// Thomas Burkhart. Please view the source tweet [here](https://twitter.com/thomasburkhartb/status/1384162926609666050?s=21)
void printFullStacktraces() {
  FlutterError.onError = (FlutterErrorDetails details) =>
      FlutterError.dumpErrorToConsole(details, forceReport: true);
}
