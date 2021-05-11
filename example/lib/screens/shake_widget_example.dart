import 'package:bluejay/bluejay.dart';
import 'package:flutter/material.dart';

import '../widgets/author_button.dart';

class ShakeWidgetExample extends StatelessWidget {
  final _shakeKey = GlobalKey<ShakeWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShakeWidget Example'),
        actions: [
          AuthorButton(
            authorName: 'Andrea Bizzotto',
            authorAvatarUrl:
                'https://pbs.twimg.com/profile_images/1324624470162739201/wu6bJ9gZ_400x400.png',
            sourceUrl:
                'https://twitter.com/biz84/status/1392157293823860736?s=21',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextEditingControllerBuilder(
                text: 'abc@email.com',
                builder: (_, controller) => TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextEditingControllerBuilder(
                text: '1234',
                builder: (_, controller) => TextField(
                  controller: controller,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(175, 42),
                ),
                onPressed: () => _shakeKey.currentState?.shake(),
                child: Text('Sign in'),
              ),
              const SizedBox(height: 16.0),
              ShakeWidget(
                key: _shakeKey,
                shakeCount: 3,
                shakeOffset: 10,
                shakeDuration: Duration(milliseconds: 400),
                child: Text(
                  'Invalid credentials',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
