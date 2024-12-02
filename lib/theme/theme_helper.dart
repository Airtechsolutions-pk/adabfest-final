import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onErrorContainer.withOpacity(1),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.red500,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primaryContainer.withOpacity(0.06),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.black900,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 16.fSize,
          fontFamily: 'Anek Gurmukhi',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray70001,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray700,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 28.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 24.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: appTheme.red500,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900.withOpacity(0.65),
          fontSize: 20.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFE30512),
    primaryContainer: Color(0xffE30512),
    secondaryContainer: Color(0XFF6E6E6E),

    // Error colors
    errorContainer: Color(0XFF444444),
    onErrorContainer: Color(0X9EFFFFFF),

    // On colors(text colors)
    onPrimary: Color(0XFF110C26),
    onPrimaryContainer: Color(0XFFAEAEAE),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue50 => Color(0XFFEBF5FC);

  // BlueGrayf
  Color get blueGray1003f => Color(0X3FD2D4E2);
  Color get blueGray6000f => Color(0X0F4F5588);

  // BlueGray
  Color get blueGray50 => Color(0XFFF1F1F1);
  Color get blueGray900 => Color(0XFF263238);

  // Gray
  Color get gray100 => Color(0XFFF4F4F4);
  Color get gray200 => Color(0XFFECECEC);
  Color get gray20001 => Color(0XFFEFEFEF);
  Color get gray20002 => Color(0XFFEEEBEB);
  Color get gray300 => Color(0XFFE4DEDE);
  Color get gray30001 => Color(0XFFE5E5E5);
  Color get gray50 => Color(0XFFF9F9F9);
  Color get gray500 => Color(0XFF979797);
  Color get gray50001 => Color(0XFF9D9898);
  Color get gray600 => Color(0XFF7F7979);
  Color get gray700 => Color(0XFF5E5E5E);
  Color get gray70001 => Color(0XFF5A5A5A);
  Color get gray70011 => Color(0X11595959);

  // Grayf
  Color get gray4007f => Color(0X7FB2B2B2);

  // Indigo
  Color get indigo20021 => Color(0X219CB1D5);

  // Orange
  Color get orange200 => Color(0XFFFFCD6B);
  Color get orange300 => Color(0XFFFFB459);

  // Red
  Color get red400 => Color(0XFFEB5757);
  Color get red40001 => Color(0XFFE30512);
  Color get red500 => Color(0XFFFF3F3F);
  Color get red600 => Color(0XFFE43E2B);
  Color get red100 => Color(0XFFFFD5D5);

  Color get red500A6 => Color(0XA6FF4040);
  Color get redA200 => Color(0XFFFF4C4C);

  // Teal
  Color get teal200 => Color(0XFF7BD6AA);
  Color get tealA700 => Color(0XFF00B6AA);
  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
  Color get redA223 => Color(0XFF990000);

  // Yellow
  Color get yellow200 => Color(0XFFF6EF97);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
