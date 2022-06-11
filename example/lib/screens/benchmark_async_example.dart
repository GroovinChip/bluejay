import 'package:bluejay/bluejay.dart';
import 'package:flutter/material.dart';

import '../widgets/author_button.dart';

class BenchmarkAsyncExample extends StatefulWidget {
  const BenchmarkAsyncExample({super.key});

  @override
  State<BenchmarkAsyncExample> createState() => _BenchmarkAsyncExampleState();
}

class _BenchmarkAsyncExampleState extends State<BenchmarkAsyncExample> {
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
                'https://twitter.com/luke_pighetti/status/1377397751273684995?s=21',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // ignore: void_checks
                benchmarkAsync('Test', () async => await Future.value(5));
              },
              child: const Text('BENCHMARK'),
            ),
          ],
        ),
      ),
    );
  }
}
