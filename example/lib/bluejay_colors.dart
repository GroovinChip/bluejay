import 'package:flutter/material.dart';

const int _bluejayPrimaryValue = 0xFF3E5F91;
const int _bluejayAccentValue = 0xFF6C98FF;

const MaterialColor bluejayPrimary =
    MaterialColor(_bluejayPrimaryValue, <int, Color>{
  50: Color(0xFFE8ECF2),
  100: Color(0xFFC5CFDE),
  200: Color(0xFF9FAFC8),
  300: Color(0xFF788FB2),
  400: Color(0xFF5B77A2),
  500: Color(_bluejayPrimaryValue),
  600: Color(0xFF385789),
  700: Color(0xFF304D7E),
  800: Color(0xFF284374),
  900: Color(0xFF1B3262),
});

const MaterialColor bluejayAccent =
    MaterialColor(_bluejayAccentValue, <int, Color>{
  100: Color(0xFF9FBCFF),
  200: Color(_bluejayAccentValue),
  400: Color(0xFF3974FF),
  700: Color(0xFF1F62FF),
});
