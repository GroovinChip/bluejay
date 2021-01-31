import 'package:flutter/material.dart';

import 'bluejay_colors.dart';
import 'bluejay_gallery.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluejay Gallery',
      theme: ThemeData(
        primarySwatch: bluejayPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BluejayGallery(),
    );
  }
}
