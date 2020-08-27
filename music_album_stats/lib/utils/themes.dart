import 'package:flutter/material.dart';
import 'package:music_album_stats/utils/colors.dart';

class ThemesUtils {
  static ThemeData darkTheme() {
    final base = ThemeData.dark();

    return base.copyWith(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorsUtils.aqua,
      ),
    );
  }

  static ThemeData lightTheme() {
    final base = ThemeData.light();

    return base.copyWith(
      appBarTheme: AppBarTheme(
        color: ColorsUtils.orange,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorsUtils.orange,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: ColorsUtils.orange,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}