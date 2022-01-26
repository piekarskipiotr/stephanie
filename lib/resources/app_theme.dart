import 'package:flutter/material.dart';

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
    primaryColor: AppColors.darkBlue,
    primarySwatch: ColorHelper.toMaterialColor(AppColors.darkBlue),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkBlue,
      primaryVariant: AppColors.darkBlue,
      secondary: AppColors.green,
      onSecondary: AppColors.green,
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
          color: AppColors.darkBlue,
        ),
      ),
    ),
  );
}
