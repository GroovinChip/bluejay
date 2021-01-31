import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        physics: ClampingScrollPhysics(),
        children: [
          ListTile(
            title: Text(
              'DeferInit',
              style: GoogleFonts.firaCode(),
            ),
            subtitle: Text('Prevents the initialization of UI until the '
                'provided asynchronous task is completed'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DeferInitExample(),
              ),
            ),
          ),
          ListTile(
            title: Text('ThemeBrightnessAnimatedBuilder'),
            subtitle: Text('Creator: Luke Pighetti'),
            trailing: Icon(Icons.chevron_right),
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
