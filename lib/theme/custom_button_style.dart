import 'dart:ui';
import 'package:adabfest/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray600.withOpacity(0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.h),
        ),
      );
  static ButtonStyle get fillPrimaryTL8 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.h),
    ),
  );
  static ButtonStyle get fillOnErrorContainer => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onErrorContainer.withOpacity(0.25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.h),
        ),
      );
  static ButtonStyle get fillRedA => ElevatedButton.styleFrom(
    backgroundColor: appTheme.redA200,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.h),
    ),
  );
  static ButtonStyle get fillPrimaryTL4 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary.withOpacity(0.09),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.h),
    ),
  );
  static ButtonStyle get outlineGrayTL6 => OutlinedButton.styleFrom(
    backgroundColor: appTheme.whiteA700,
    side: BorderSide(
      color: appTheme.gray500,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.h),
    ),
  );
  static ButtonStyle get fillRed => ElevatedButton.styleFrom(
    backgroundColor: appTheme.red40001,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.h),
    ),
  );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.h),
        ),
      );

  // Outline button style
  static ButtonStyle get outlineBlack => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onErrorContainer.withOpacity(1),
        shadowColor: appTheme.black900.withOpacity(0.07),
        elevation: -1,
      );
  static ButtonStyle get outlineGray => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.onErrorContainer.withOpacity(1),
        side: BorderSide(
          color: appTheme.gray200,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  static ButtonStyle get outlineGrayTL10 => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.onErrorContainer.withOpacity(1),
        side: BorderSide(
          color: appTheme.gray30001,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
      );
  static ButtonStyle get outlinePrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
        shadowColor: theme.colorScheme.primary.withOpacity(0.15),
        elevation: 6,
      );

  static ButtonStyle get login => ElevatedButton.styleFrom(
    backgroundColor: Color(0xff6E1D29),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
    shadowColor:  Color(0xff6E1D29).withOpacity(0.15),
    elevation: 6,
  );
  static ButtonStyle get outlineRed => OutlinedButton.styleFrom(
        backgroundColor: appTheme.red40001,
        side: BorderSide(
          color: appTheme.red40001,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.h),
        ),
      );

  static ButtonStyle get inline => OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    side: BorderSide(
      color: appTheme.red40001,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.h),
    ),
  );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
