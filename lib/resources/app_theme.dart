import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'colors/app_colors.dart';
import 'colors/color_helper.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    primarySwatch: ColorHelper.toMaterialColor(AppColors.primary),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.darkBlue,
      onSecondary: AppColors.darkBlue,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: appBarSystemUIOverlayStyle,
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
      secondary: AppColors.primary,
      onSecondary: AppColors.primary,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: appBarSystemUIOverlayStyle,
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

  static final appBarSystemUIOverlayStyle = SystemUiOverlayStyle(
    statusBarIconBrightness: setBrightnessToLight(),
    statusBarBrightness: setBrightnessToLight(),
  );

  // System components like notification bar, navigation bar
  static void initSystemUIStyle() {
    // line below is for return bottom and top navigation hidden by splash screen
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
    );

    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      );
    }
  }

  static setBrightnessToLight() =>
      Platform.isAndroid ? Brightness.light : Brightness.dark;

  static setBrightnessToDark() =>
      Platform.isAndroid ? Brightness.dark : Brightness.light;

  static bool isDarkMode() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.dark;
  }
}
