import 'package:bluejay/bluejay.dart';
import 'package:flutter/material.dart';

import '../widgets/author_button.dart';

class TextEditingControllerBuilderExample extends StatefulWidget {
  const TextEditingControllerBuilderExample({super.key});

  @override
  State<TextEditingControllerBuilderExample> createState() =>
      _TextEditingControllerBuilderExampleState();
}

class _TextEditingControllerBuilderExampleState
    extends State<TextEditingControllerBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TECB Example'),
        actions: const [
          AuthorButton(
            authorName: 'Luke Pighetti',
            authorAvatarUrl:
                'https://pbs.twimg.com/profile_images/1353406162939514880/1bbUvJoR_400x400.jpg',
            sourceUrl:
                'https://gist.github.com/lukepighetti/55d367808e994e426fc0c7f7032fab9c',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextEditingControllerBuilder(
            text: 'Initial text',
            builder: (context, controller) {
              return TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
