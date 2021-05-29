import 'package:bluejay/bluejay.dart';
import 'package:flutter/material.dart';

import '../widgets/author_button.dart';

class BenchmarkAsyncExample extends StatefulWidget {
  BenchmarkAsyncExample({Key? key}) : super(key: key);

  @override
  _BenchmarkAsyncExampleState createState() => _BenchmarkAsyncExampleState();
}

class _BenchmarkAsyncExampleState extends State<BenchmarkAsyncExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TECB Example'),
        actions: [
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
                benchmarkAsync('Test', () async => await Future.value(5));
              },
              child: Text('BENCHMARK'),
            ),
          ],
        ),
      ),
    );
  }
}
