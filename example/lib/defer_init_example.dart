import 'dart:math' show Random;

import 'package:bluejay/bluejay.dart';
import 'package:flutter/material.dart';

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
  const DeferInitExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DeferInit(
        onDefer: () async {
          await MyService.init();
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
