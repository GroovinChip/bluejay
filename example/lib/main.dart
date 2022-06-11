import 'package:bluejay/bluejay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bluejay_colors.dart';
import 'bluejay_gallery.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  printFullStacktraces();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => LoggingService(
        loggers: {
          ConsoleLogger(),
        },
      ),
      child: MaterialApp(
        title: 'Bluejay Gallery',
        theme: ThemeData(
          //brightness: Brightness.light,
          primarySwatch: bluejayPrimary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const BluejayGallery(),
      ),
    );
  }
}
