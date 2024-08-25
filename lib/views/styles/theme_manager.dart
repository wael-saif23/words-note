import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:words_note/views/styles/color_manager.dart';

abstract class ThemeManager {
  static ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorManager.midnightGreen,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.midnightGreen,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ColorManager.emerald,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.midnightGreen,
          systemNavigationBarColor: ColorManager.midnightGreen,
          systemNavigationBarDividerColor: ColorManager.midnightGreen,
        ),
      ),
    );
  }
}
