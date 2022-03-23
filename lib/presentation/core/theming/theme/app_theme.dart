// ignore_for_file: avoid_classes_with_only_static_members

import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Represent app theme.
class AppTheme {
  static ThemeData lightTheme = _buildLightAppTheme();
  static ThemeData _buildLightAppTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 1,
        titleTextStyle: TextStyle(
          color: AstraColors.black,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
      textTheme: _lightTextTheme(base.textTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          primary: AstraColors.mainGold,
          onPrimary: AstraColors.white,
          textStyle: const TextStyle(
            color: AstraColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      errorColor: AstraColors.errorColor,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            color: AstraColors.textLinkColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AstraColors.dividerColor,
        thickness: 1,
      ),
      dividerColor: AstraColors.dividerColor,
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AstraColors.dividerColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AstraColors.black,
          ),
        ),
      ),
    );
  }

  /// [titleMedium] - As the largest text on the registration screens. Font size 28.
  /// [titleSmall] - appbar text style.
  /// [bodyText1] - font size 15. for large body text.
  /// [bodyText2] - font size 12. color for large body text.
  static TextTheme _lightTextTheme(TextTheme baseTextTheme) {
    return baseTextTheme.copyWith(
      displayMedium: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: AstraColors.black,
      ),
      titleMedium: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: AstraColors.black,
      ),
      titleSmall: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AstraColors.textAppbarColor,
      ),
      bodyMedium: const TextStyle(
        color: AstraColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      bodySmall: const TextStyle(
        color: AstraColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    );
  }
}
