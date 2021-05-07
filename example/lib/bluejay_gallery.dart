import 'package:bluejay/bluejay.dart';
import 'package:example/screens/text_editing_contoller_builder_example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/defer_init_example.dart';
import 'screens/logger_example.dart';
import 'screens/theme_brightness_animated_builder_example.dart';
import 'widgets/bluejay_item_tile.dart';

class BluejayGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoggingService>(
      builder: (context, logger, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Bluejay Gallery'),
          ),
          body: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              BluejayItemTile(
                name: 'DeferInit',
                description: 'Prevents UI initialization until the '
                    'provided async task is completed',
                onTap: () {
                  logger.log('gallery', 'tapped "DeferInit"');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DeferInitExample(),
                    ),
                  );
                },
              ),
              BluejayItemTile(
                name: 'ThemeBrightnessAnimatedBuilder',
                description:
                    'Simple animation between light/dark themes; tied to MaterialApp\'s ThemeData.',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ThemeBrightnessAnimatedBuilderExample(),
                  ),
                ),
              ),
              BluejayItemTile(
                name: 'TextEditingControllerBuilder',
                description:
                    'Exposes a TextEditingController to a child widget, which allows any TextField to be declarative.',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => TextEditingControllerBuilderExample(),
                  ),
                ),
              ),
              BluejayItemTile(
                name: 'Logger',
                description:
                    'A simple logging service using extensions for channels with multiple outputs',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => LoggerExample(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
