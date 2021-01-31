import 'package:flutter/material.dart';

import 'defer_init_example.dart';
import 'theme_brightness_animated_builder_example.dart';

class BluejayGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluejay Gallery'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('DeferInit'),
            subtitle: Text('Creator: Simon Lightfoot'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DeferInitExample(),
              ),
            ),
          ),
          ListTile(
            title: Text('ThemeBrightnessAnimatedBuilder'),
            subtitle: Text('Creator: Luke Pighetti'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ThemeBrightnessAnimatedBuilderExample(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
