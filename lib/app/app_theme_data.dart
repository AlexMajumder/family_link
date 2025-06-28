import 'package:flutter/material.dart';
import 'app_color.dart';

class AppThemeData {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.themeColor,
          elevation: 3,
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.themeColor),
      ),
      navigationBarTheme: NavigationBarThemeData(backgroundColor: Colors.white),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.themeColor,
        splashColor: Colors.white,
      ),
    );
  }

  static ThemeData get darkThemeData {
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),
      brightness: Brightness.dark,
      navigationBarTheme: NavigationBarThemeData(backgroundColor: Colors.black),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.themeColor,
          elevation: 3,
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: AppColors.themeColor,
        splashColor: Colors.white,
      ),
    );
  }
}
