import 'dart:ui';

import 'package:bluejay/bluejay.dart';
import 'package:example/widgets/author_button.dart';
import 'package:flutter/material.dart';

class FadeIndexedStackExample extends StatefulWidget {
  FadeIndexedStackExample({Key? key}) : super(key: key);

  @override
  _FadeIndexedStackExampleState createState() =>
      _FadeIndexedStackExampleState();
}

class _FadeIndexedStackExampleState extends State<FadeIndexedStackExample> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FadeIndexedStack Example'),
        actions: [
          AuthorButton(
            authorName: 'Diego Velásquez López',
            authorAvatarUrl:
                'https://avatars.githubusercontent.com/u/4898256?v=4',
            sourceUrl:
                'https://gist.github.com/diegoveloper/1cd23e79a31d0c18a67424f0cbdfd7ad',
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.account_circle),
                label: Text('Account'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              setState(() => selectedIndex = value);
            },
          ),
          Expanded(
            child: FadeIndexedStack(
              index: selectedIndex,
              children: [
                Center(
                  child: Container(
                    height: 50,
                    width: 150,
                    color: Colors.indigo,
                    alignment: Alignment.center,
                    child: Text(
                      'Account',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 150,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}