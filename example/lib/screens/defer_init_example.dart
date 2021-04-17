import 'dart:math' show Random;

import 'package:bluejay/bluejay.dart';
import 'package:example/widgets/author_button.dart';
import 'package:flutter/material.dart';

import '../widgets/info_dialog.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeferInit'),
        actions: [
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
          await Future.delayed(Duration(seconds: 1));
          if (MyService.instance.isLoggedIn()) {
            return Center(
              child: Text('Not logged in'),
            );
          } else {
            return Center(
              child: Text('Logged In'),
            );
          }
        },
        loadingWidget: Center(
          child: CircularProgressIndicator(),
        ),
        emptyWidget: Center(
          child: Text('No Data'),
        ),
      ),
    );
  }
}
