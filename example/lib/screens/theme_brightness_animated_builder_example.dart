import 'package:bluejay/bluejay.dart';
import 'package:flutter/material.dart';

import '../widgets/author_button.dart';

class ThemeBrightnessAnimatedBuilderExample extends StatefulWidget {
  const ThemeBrightnessAnimatedBuilderExample({super.key});

  @override
  State<ThemeBrightnessAnimatedBuilderExample> createState() =>
      _ThemeBrightnessAnimatedBuilderExampleState();
}

class _ThemeBrightnessAnimatedBuilderExampleState
    extends State<ThemeBrightnessAnimatedBuilderExample> {
  bool isLight = true;
  Brightness brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TBAB Example'),
        actions: const [
          AuthorButton(
            authorName: 'Luke Pighetti',
            authorAvatarUrl:
                'https://pbs.twimg.com/profile_images/1353406162939514880/1bbUvJoR_400x400.jpg',
            sourceUrl:
                'https://gist.github.com/lukepighetti/074f505903e7ab5561da7e8e7fda04b2',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
              data: ThemeData(
                brightness: brightness,
              ),
              child: ThemeBrightnessAnimatedBuilder(
                builder: (context, t, child) {
                  final lightThemeColor = Colors.red.shade800;
                  final darkThemeColor = Colors.red.shade200;

                  return Container(
                    width: 100,
                    height: 100,

                    /// Light theme color goes on the right, dark theme on the left.
                    color: Color.lerp(lightThemeColor, darkThemeColor, t),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            Text(isLight ? 'Light' : 'Dark'),
            Switch.adaptive(
              value: isLight,
              onChanged: (value) {
                setState(() {
                  isLight = value;
                  brightness = isLight ? Brightness.light : Brightness.dark;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
