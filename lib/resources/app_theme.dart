import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'colors/app_colors.dart';
import 'colors/color_helper.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    primarySwatch: ColorHelper.toMaterialColor(AppColors.primary),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      primaryVariant: AppColors.primary,
      secondary: AppColors.darkBlue,
      onSecondary: AppColors.darkBlue,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.0),
        ),
        side: const BorderSide(
          width: 2.0,
          color: AppColors.primary,
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.green,
    primarySwatch: ColorHelper.toMaterialColor(AppColors.green),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.green,
      primaryVariant: AppColors.green,
      secondary: AppColors.primary,
      onSecondary: AppColors.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
          ),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.0),
        ),
        side: const BorderSide(
          width: 2.0,
          color: AppColors.green,
        ),
      ),
    ),
  );

  static bool isDarkMode() {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    return brightness == Brightness.dark;
  }
}
