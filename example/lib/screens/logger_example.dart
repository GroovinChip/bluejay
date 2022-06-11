import 'package:bluejay/bluejay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/author_button.dart';

class LoggerExample extends StatelessWidget {
  const LoggerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoggingService>(
      builder: (context, logger, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Logger'),
            actions: const [
              AuthorButton(
                authorName: 'Luke Pighetti',
                authorAvatarUrl:
                    'https://pbs.twimg.com/profile_images/1353406162939514880/1bbUvJoR_400x400.jpg',
                sourceUrl:
                    'https://gist.github.com/lukepighetti/5283229a351ab394376e84cff8277bdb',
              )
            ],
          ),
          body: Center(
            child: TextButton(
              child: const Text('LOG ME'),
              onPressed: () => logger.log('LoggerExample', 'This is a log'),
            ),
          ),
        );
      },
    );
  }
}
