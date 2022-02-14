import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData lightTheme = _buildLightAppTheme();

  static ThemeData _buildLightAppTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      textTheme: _lightTextTheme(base.textTheme),
    );
  }

  static TextTheme _lightTextTheme(TextTheme baseTextTheme) {
    return baseTextTheme.copyWith();
  }
}
