import 'package:bluejay/bluejay.dart';
import 'package:flutter/material.dart';

// todo: brightness toggles (requires SharedPreferences, etc)
class ThemeBrightnessAnimatedBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TBAB Example'),
      ),
      body: ThemeBrightnessAnimatedBuilder(
        builder: (context, t, child) {
          final lightThemeColor = Colors.red.shade800;
          final darkThemeColor = Colors.red.shade200;

          return Center(
            child: Container(
              width: 50,
              height: 50,

              /// Light theme color goes on the right, dark theme on the left.
              color: Color.lerp(lightThemeColor, darkThemeColor, t),
            ),
          );
        },
      ),
    );
  }
}
