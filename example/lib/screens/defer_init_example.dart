import 'dart:math' show Random;

import 'package:bluejay/bluejay.dart';
import 'package:flutter/material.dart';

import '../widgets/author_button.dart';

class MyService {
  MyService._();

  static MyService? _instance;

  static MyService get instance => _instance!;

  static Future<MyService> init() async {
    if (_instance == null) {
      await Future.delayed(const Duration(seconds: 1));
      _instance = MyService._();
    }
    return _instance!;
  }

  bool isLoggedIn() {
    return Random(DateTime.now().millisecondsSinceEpoch).nextBool();
  }
}

@immutable
class DeferInitExample extends StatelessWidget {
  const DeferInitExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeferInit'),
        actions: const [
          AuthorButton(
            authorName: 'Simon Lightfoot',
            authorAvatarUrl:
                'https://avatars.githubusercontent.com/u/906564?s=400&u=04fbc0cb91f1e6f3a17a6161d0823d694fcd9da5&v=4',
            sourceUrl:
                'https://gist.github.com/slightfoot/85d39f7c235119b724b6b1fa4afa0b41',
          ),
        ],
      ),
      body: DeferInit(
        onDefer: () async {
          await MyService.init();
          await Future.delayed(const Duration(seconds: 1));
          if (MyService.instance.isLoggedIn()) {
            return const Center(
              child: Text('Not logged in'),
            );
          } else {
            return const Center(
              child: Text('Logged In'),
            );
          }
        },
        loadingWidget: const Center(
          child: CircularProgressIndicator(),
        ),
        emptyWidget: const Center(
          child: Text('No Data'),
        ),
      ),
    );
  }
}
